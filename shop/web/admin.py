from django.contrib import admin
from web.models import * 
from django.forms import ModelChoiceField, ModelForm, ValidationError
from PIL import Image


class NotebookAdminForm(ModelForm):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['image'].help_text = "Минимальное разрешение изображения - {}px{}px".format(*Product.MIN_RESOLUTION)

    def clean_image(self):
        image = Image.open(self.cleaned_data['image'])

        min_height, min_width = Product.MIN_RESOLUTION
        max_height, max_width = Product.MAX_RESOLUTION

        if self.cleaned_data['image'].size > Product.MAX_IMAGE_SIZE:
            raise ValidationError('Слишком большая картинка')

        if image.height < min_height or image.width < min_width:
            raise ValidationError('Разрешение изображения меньше минимального')
                
        if image.height > max_height or image.width > max_width:
            raise ValidationError('Разрешение изображения больше минимального')
        
        return self.cleaned_data['image']

class SmartphoneAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'category', 'image', 'slug')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price', 'category')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug="smartphones"), label='Категория')
        return super().formfield_for_foreignkey(db_field, request, **kwargs) 

class NotebookAdmin(admin.ModelAdmin):

    form = NotebookAdminForm

    list_display = ('title', 'price', 'category', 'image', 'slug')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price', 'category')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug="laptops"), label='Категория')
        return super().formfield_for_foreignkey(db_field, request, **kwargs) 

class HeadPhonesAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'category', 'image', 'slug')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price', 'category')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug="headphones"), label='Категория')
        return super().formfield_for_foreignkey(db_field, request, **kwargs) 

class PowerBankAdmin(admin.ModelAdmin):
    list_display = ('title', 'price', 'category', 'image', 'slug')
    list_display_links = ('title', 'price')
    search_fields = ('title', 'price', 'category')

    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'category':
            return ModelChoiceField(Category.objects.filter(slug="powerbanks"), label='Категория')
        return super().formfield_for_foreignkey(db_field, request, **kwargs) 

class OrderAdmin(admin.ModelAdmin):
    list_display = ('customer', 'first_name', 'last_name', 'cart', 'phone')
    list_display_links = ('customer', 'first_name', 'phone')
    search_fields = ('id', 'first_name', 'phone') 


admin.site.register(Smartphone,SmartphoneAdmin)
admin.site.register(Category)
admin.site.register(CartProduct)
admin.site.register(Cart)
admin.site.register(Notebook, NotebookAdmin)
admin.site.register(Customer)
admin.site.register(HeadPhones, HeadPhonesAdmin)
admin.site.register(Order, OrderAdmin)
admin.site.register(PowerBank, PowerBankAdmin)



# Register your models here.
