from django.shortcuts import render
from django.http import HttpResponse
from .models import *


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




# def by_category(request, category_id):
#     item = Smartphone.objects.filter(category=category_id)
#     category = Category.objects.all()
#     current_category = Category.objects.get(pk=category_id)
#     context = {'item':item, 'category':category, 'current_category':current_category}
#     return render(request, 'web/by_category.html', context)








# def index(request):
#     template = loader.get_template('web/index.html')
#     item = Smartphone.objects.order_by('price')
#     context = {'item':item}
#     return HttpResponse(template.render(context, request))


    # for i in Smartphone.objects.order_by('price'):
    #     s += i.title + '\r\n' + i.main_cam + '\r\n\r\n'
    # return HttpResponse(s, content_type='text/plain; charset=utf-8')



# def index(request):
#     s = 'Список товаров \r\n\r\n\r\n'
#     for i in Smartphone.objects.order_by('title'):
#         s += s.title + '\r\n' + s.price + '\r\n\n'
#     return HttpResponse(s, content_type='text/plain; charset=utf-8')

# Create your views here.
