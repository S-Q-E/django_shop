from django.shortcuts import render
from django.http import HttpResponse
from .models import *
from django.views.generic import DetailView

def index(request):
    smartphones = Smartphone.objects.all()
    laptops = Notebook.objects.all()
    powerbanks = PowerBank.objects.all()
    headphones = HeadPhones.objects.all()
    return render(request,'base.html', {
        'smartphones': smartphones,
        'laptops': laptops,
        'powerbanks': powerbanks,
        'headphones': headphones
    })


class ProductDetailView(DetailView):

    CT_MODEL_MODEL_CLASS = {
        'notebook': Notebook,
        'smartphones': Smartphone,
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


