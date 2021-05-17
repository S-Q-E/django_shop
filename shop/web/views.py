from itertools import chain
from django.core.checks import messages as mes
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponse, HttpResponseRedirect, request
from .models import *
from django.views.generic import DetailView, View
from .mixins import CategoryDetailMixin, CartMixin
from django.db.models import Q
from .forms import OrderForm
from .utils import recalc_cart
from django.contrib import messages 


class IndexView(CartMixin, View):
    def get(self, request,*args, **kwargs):
        context = {
            'categories': Category.objects.get_categories_for_left_sidebar(),
            'products': LatestProduct.object.get_products_for_main_page('notebook', 'smartphone','headphones','powerbanks'),
            'cart': self.cart 
        }
        return render(request, 'base.html', context)



class ProductDetailView(CartMixin, CategoryDetailMixin, DetailView):

    CT_MODEL_MODEL_CLASS = {
        'notebook': Notebook,
        'smartphone': Smartphone,
        'powerbank': PowerBank,
        'headphones': HeadPhones
    }

    def dispatch(self, request,  *args, **kwargs):
        self.model = self.CT_MODEL_MODEL_CLASS[kwargs['ct_model']]
        self.queryset = self.model._base_manager.all()
        return super().dispatch(request, *args, **kwargs)

    context_object_name = 'product'
    template_name = 'product_detail.html'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['ct_model'] = self.model._meta.model_name
        context['cart'] = self.cart
        return context



class CategoryDetailView(CartMixin, CategoryDetailMixin, DetailView):
    model = Category
    queryset = Category.objects.all()
    context_object_name = 'category'
    template_name = 'category_detail.html'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['cart'] = self.cart
        return context




class CartView(CartMixin, View):

    def get(self, request, *args, **kwargs):
        categories = Category.objects.get_categories_for_left_sidebar()
        context = {
            'cart': self.cart,
            'categories': categories
        }
        return render(request, 'cart.html', context)


class CheckoutView(CartMixin, View):

    def get(self, request, *args, **kwargs):
        categories = Category.objects.get_categories_for_left_sidebar()
        form = OrderForm(request.POST or None)
        context = {
            'cart': self.cart,
            'categories': categories,
            'form': form 
        }
        return render(request, 'check-out.html', context)




class AddToCartView(CartMixin, View):
    
    def get(self, request, *args, **kwargs):
        ct_model, product_slug = kwargs.get('ct_model'), kwargs.get('slug')
        content_type = ContentType.objects.get(model=ct_model)
        product = content_type.model_class().objects.get(slug= product_slug)
        cart_product, created = CartProduct.objects.get_or_create(
            user=self.cart.owner, cart=self.cart, content_type=content_type, object_id=product.id
        )
        if created:
            self.cart.products.add(cart_product)
        recalc_cart(self.cart)
        return HttpResponseRedirect('/cart/')



class DeleteFromCartView(CartMixin, View):

    def get(self, request, *args, **kwargs):
        ct_model, product_slug = kwargs.get('ct_model'), kwargs.get('slug')
        content_type = ContentType.objects.get(model=ct_model)
        product = content_type.model_class().objects.get(slug= product_slug)
        cart_product = CartProduct.objects.get(
            user=self.cart.owner, cart=self.cart, content_type=content_type, object_id=product.id
        )
        self.cart.products.remove(cart_product)
        cart_product.delete()
        recalc_cart(self.cart)
        return HttpResponseRedirect('/cart/')


class ChangeQtyView(CartMixin, View):

    def post(self, request, *args, **kwargs):
        ct_model, product_slug = kwargs.get('ct_model'), kwargs.get('slug')
        content_type = ContentType.objects.get(model=ct_model)
        product = content_type.model_class().objects.get(slug= product_slug)
        cart_product = CartProduct.objects.get(
            user=self.cart.owner, cart=self.cart, content_type=content_type, object_id=product.id
        )
        qty = int(request.POST.get('qty'))
        cart_product.quantity = qty
        cart_product.save()
        recalc_cart(self.cart)
        return HttpResponseRedirect('/cart/')


class MakeOrderView(CartMixin, View):

    def post(self, request, *args, **kwargs):
        form = OrderForm(request.POST or None)
        if form.is_valid():
            new_order = form.save(commit=False)
            new_order.customer = Customer.objects.get(user=request.user)
            new_order.first_name = form.cleaned_data['first_name']
            new_order.last_name = form.cleaned_data['last_name']
            new_order.phone = form.cleaned_data['phone']
            new_order.address = form.cleaned_data['address']
            new_order.delivery_type = form.cleaned_data['delivery_type']
            new_order.order_date = form.cleaned_data['order_date']
            new_order.save()
            self.cart.in_order = True
            self.cart.save()
            new_order.cart = self.cart
            new_order.save()
            messages.add_message(request, messages.INFO, 'Спасибо за заказ! Менеджер свяжется с вами в ближайшее время!')
            return HttpResponseRedirect('/')
        return HttpResponseRedirect('/check_out/')

class SearchView(CartMixin, CategoryDetailMixin, View):
    
    def get(self, request, *args, **kwargs):
        context = {}
        search_query = request.GET.get('search')
        if search_query:
            query_sets = []

            query_sets.append(Smartphone.objects.search(query=search_query))
            query_sets.append(Notebook.objects.search(query=search_query))
            query_sets.append(HeadPhones.objects.search(query=search_query))
            query_sets.append(PowerBank.objects.search(query=search_query))

            final_set = list(chain(*query_sets))
            final_set.sort(key=lambda x: x.id, reverse=True)
            

            context['last_question'] = '?q=%s' % search_query
            context['cart'] = self.cart
            current_page = Paginator(final_set,10)

            page = request.GET.get('')
            try:
                context['object_list'] = current_page.page(page)
            except PageNotAnInteger:
                context['object_list'] = current_page.page(1)
            except EmptyPage:
                context['object_list'] = current_page.page(current_page.num_pages)
            

        return render(request, 'search.html' ,context)



 