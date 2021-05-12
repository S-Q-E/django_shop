from itertools import chain
from django.core.paginator import Paginator, PageNotAnInteger, EmptyPage
from django.shortcuts import render
from django.contrib.contenttypes.models import ContentType
from django.http import HttpResponse, HttpResponseRedirect
from .models import *
from django.views.generic import DetailView, View
from .mixins import CategoryDetailMixin, CartMixin
from django.db.models import Q


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
        return context



class CategoryDetailView(CartMixin, CategoryDetailMixin, DetailView):
    model = Category
    queryset = Category.objects.all()
    context_object_name = 'category'
    template_name = 'category_detail.html'
    slug_url_kwarg = 'slug'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        return context




class CartView(CartMixin, View):

    def get(self, request, *args, **kwargs):
        categories = Category.objects.get_categories_for_left_sidebar()
        context = {
            'cart': self.cart,
            'categories': categories
        }
        return render(request, 'cart.html', context)

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
        self.cart.save()
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
        self.cart.save()
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
        self.cart.save()
        return HttpResponseRedirect('/cart/')




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

            current_page = Paginator(final_set,10)

            page = request.GET.get('')
            try:
                context['object_list'] = current_page.page(page)
            except PageNotAnInteger:
                context['object_list'] = current_page.page(1)
            except EmptyPage:
                context['object_list'] = current_page.page(current_page.num_pages)
            

        return render(request, 'search.html',context)



 