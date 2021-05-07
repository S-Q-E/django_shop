from django.urls import path
from web.views import *

urlpatterns = [
    path('', index, name='index'),
    path('products/<str:ct_model>/<str:slug>/', ProductDetailView.as_view(), name='product_detail')
#     path('smartphones', smartphone),
#     path('laptops', laptops),
#     path('powerbanks', powerbank),
#     path('headphones', headphones)
]


