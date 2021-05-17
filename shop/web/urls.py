from django.urls import path
from web.views import *

urlpatterns = [
    path('', IndexView.as_view(), name='index'),
    path('products/<str:ct_model>/<str:slug>/', ProductDetailView.as_view(), name='product_detail'),
    path('category/<str:slug>/', CategoryDetailView.as_view(), name='category_detail'),
    path('cart/', CartView.as_view(), name='cart'),
    path('add-to-cart/<str:ct_model>/<str:slug>/', AddToCartView.as_view(), name='add_to_cart'),
    path('remove-from-cart/<str:ct_model>/<str:slug>/', DeleteFromCartView.as_view(), name='remove_from_cart'),
    path('change-qty/<str:ct_model>/<str:slug>/', ChangeQtyView.as_view(), name='change_qty'),
    path('check-out/', CheckoutView.as_view(), name='check_out'),
    path('make_order/', MakeOrderView.as_view(), name='make_order'),
    path('search/', SearchView.as_view(), name='search')
]


