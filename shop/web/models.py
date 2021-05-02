from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey
from django.utils import timezone
from PIL import Image

User = get_user_model()


class Category(models.Model):
    
    class Meta:
        verbose_name = 'категория'
        verbose_name_plural = 'Категории'

    name = models.CharField(max_length=200, verbose_name='Название')
    slug = models.SlugField(unique=True)

    def __str__(self):
        return self.name


class Product(models.Model):

    def save(self):
        super().save()
        img = Image.open(self.image.path)
        if img.height > 900 or img.width > 900:
            output_size = (900,900)
            img.thumbnail(output_size)
            img.save(self.image.path)
        

    MIN_RESOLUTION = (400,400)
    MAX_RESOLUTION = (800,800)
    MAX_IMAGE_SIZE = 200000

    class Meta:
        abstract = True

    category = models.ForeignKey(Category, verbose_name='Категория', on_delete=models.CASCADE)
    slug = models.SlugField(unique=True)
    title = models.CharField(max_length=250, verbose_name='Название')
    description = models.TextField(verbose_name='Описание')
    price = models.DecimalField(max_digits=9, decimal_places=2, verbose_name='Цена')
    image = models.ImageField(verbose_name='Изображение')

    def __str__(self):
        return self.title


class PowerBank(Product):

    class Meta:
        verbose_name = 'Внешний аккумулятор'
        verbose_name_plural = 'Внешние аккумуляторы'

    DEFAULT_OUTPUT = 'micro_usb'
    USB_TYPE_C_OUTPUT = 'type_c'
    LIGHTNING_OUTPUT = 'lightning'
    USB_A_OUTPUT = 'usb_a'

    OUTPUT_CHOICES = (
        (DEFAULT_OUTPUT,'micro USB'),
        (USB_TYPE_C_OUTPUT,'USB Type-C'),
        (LIGHTNING_OUTPUT,'Lightning'),
        (USB_A_OUTPUT,'USB A')
    )


    battery_capacity = models.PositiveIntegerField(verbose_name='Ёмоксть батарей: Ma/h')
    outputs = models.CharField(max_length=255, verbose_name='Разъемы', choices=OUTPUT_CHOICES, default=DEFAULT_OUTPUT)
    quick_charge = models.BooleanField(default=False,verbose_name='Поддержка быстрой зарядки')






class HeadPhones(Product):
    class Meta:
        verbose_name='Наушники'
        verbose_name_plural='Наушники'


    DEFAULT_CONNECT = 'wired'
    WIRELLES_CONNECT = 'wirelles'

    CONNECT_CHOICES = (
        (DEFAULT_CONNECT,'проводные'),
        (WIRELLES_CONNECT,'беспроводные')
    )

    DEFAULT_TYPE = 'in-ear'
    OVER_EAR_TYPE = 'over_ear'
    FOR_GAMING_TYPE = 'for_gaming'

    TYPE_CHOICES = (
        (DEFAULT_TYPE, 'Вкладыши'),
        (OVER_EAR_TYPE, 'Накладные'),
        (FOR_GAMING_TYPE, 'Для геймеров')
    )
    

    DEFAULT_CENCELLING = 'passive'
    ACTIVE_CENCELLING = 'active'

    CENCELLING_CHOICES = (
        (DEFAULT_CENCELLING,'пассивное'),
        (ACTIVE_CENCELLING,'активное')
    )

    connection_type = models.CharField(max_length=255, verbose_name='Тип подключения', choices=CONNECT_CHOICES, default=DEFAULT_CONNECT)
    headphones_type = models.CharField(max_length=250, verbose_name='Тип наушников', choices=TYPE_CHOICES, default=DEFAULT_TYPE)
    microphone = models.BooleanField(default=False, verbose_name='Микрофон')
    noise_cancelling = models.CharField(max_length=255, verbose_name='Шумоподавление', choices=CENCELLING_CHOICES, default=DEFAULT_CENCELLING)


class Notebook(Product):

    class Meta:
        verbose_name = 'ноутбук' 
        verbose_name_plural = 'Ноутбуки'

    diagonal = models.CharField(max_length=250, verbose_name='Диагональ')
    display_type = models.CharField(max_length=250, verbose_name='Тип дисплея')
    ram = models.CharField(max_length=250, verbose_name='Оперативная память')
    processor_freq = models.CharField(max_length=250, verbose_name='Частота процессора')
    video = models.CharField(max_length=250, verbose_name='Видеокарта')
    time_without_charge = models.CharField(max_length=250, verbose_name='Время работы аккумулятора')
    os = models.CharField(max_length=250, verbose_name='Операционная система')


class Smartphone(Product):
    
    class Meta:
        verbose_name = 'смартфон' 
        verbose_name_plural = 'Смартфоны'
    
    diagonal = models.CharField(max_length=250, verbose_name='Диагональ')
    display_type = models.CharField(max_length=250, verbose_name='Тип дисплея')
    resolution = models.CharField(max_length=250, verbose_name='Разрешение экрана')
    
    ram = models.CharField(max_length=250, verbose_name='Оперативная память')
    accum_volume = models.CharField(max_length=250, verbose_name='Объем батареи')

    sd = models.BooleanField(default=False, verbose_name='SD карта')
    sd_volume = models.CharField(max_length=250, verbose_name='Максимальный объём sd карты', null=True, blank=True)

    main_cam = models.CharField(max_length=250, verbose_name='Задняя камера')
    frontal_cam = models.CharField(max_length=250, verbose_name='Фронтальная камера')


class Cart(models.Model):

    class Meta:
        verbose_name = 'корзина'
        verbose_name_plural = 'Корзины'

    owner = models.ForeignKey('Customer', verbose_name='Владелец', on_delete=models.CASCADE, null=True, blank=True)
    products = models.ManyToManyField('CartProduct', blank=True, related_name='products')
    total_products = models.PositiveIntegerField(default=0)
    
    in_order = models.BooleanField(default=False)
    for_anonymous_user = models.BooleanField(default=False)
    
    final_price = models.DecimalField(max_digits=9, decimal_places=2, verbose_name='Общая цена', default=0)

    
    def __str__(self):
        return str(self.id)


class CartProduct(models.Model):

    class Meta:
        verbose_name = 'продукт'
        verbose_name_plural = 'Продукты корзин'

    user = models.ForeignKey('Customer', verbose_name='Покупатель', on_delete=models.CASCADE)
    cart = models.ForeignKey('Cart', verbose_name='Корзина', on_delete=models.CASCADE)

    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    quantity = models.PositiveIntegerField(default=1)

    final_price = models.DecimalField(max_digits=9, decimal_places=2, verbose_name='Общая цена', default=0)

    def __str__(self):
        return 'Продукт %s из корзины %d' % (self.content_object.title, self.cart.id)


class Customer(models.Model):
    class Meta:
        verbose_name = 'Покупатель'
        verbose_name_plural = 'Покупатели'

    user = models.ForeignKey(User, verbose_name='Пользователь', on_delete=models.CASCADE)
    phone = models.CharField(max_length=255, verbose_name='Номер телефона')
    address = models.CharField(max_length=255, verbose_name='Адрес')
    orders = models.ManyToManyField('Order', verbose_name='Заказы покупателя', related_name='orders', null=True, blank=True)


    def __str__(self):
        return 'Покупатель %s %s' % (self.user.first_name, self.user.last_name)



class Order(models.Model):
    class Meta:
        verbose_name = 'Заказ'
        verbose_name_plural = 'Заказы'


    STATUS_DEFAULT = 'new'
    STATUS_IN_PROGRESS = 'in_progress'
    STATUS_READY = 'ready'
    STATUS_COMPLETED = 'completed'

    STATUS_CHOICES = (
        (STATUS_DEFAULT,'новый'),
        (STATUS_IN_PROGRESS ,'в процессе'),
        (STATUS_READY,'готов'),
        (STATUS_COMPLETED,'доставлен')
    )


    DELIVERY_TYPE_DEFAULT = 'pick_up'
    DELIVERY_TYPE_DELIVERY = 'delivery'

    DELIVERY_TYPE_CHOICES = (
        (DELIVERY_TYPE_DEFAULT, 'самовывоз'),
        (DELIVERY_TYPE_DELIVERY, 'доставка')
    )

    
    customer = models.ForeignKey('Customer', verbose_name='Покупатель', on_delete=models.CASCADE)

    first_name = models.CharField(max_length=255, verbose_name='Имя')
    last_name = models.CharField(max_length=255, verbose_name='Фамилия')
    phone = models.CharField(max_length=255, verbose_name='Номер телефона', blank=True, null=True)
    address = models.CharField(max_length=255, verbose_name='Адресс', blank=True, null=True)

    cart = models.ForeignKey('Cart', verbose_name='Корзина', on_delete=models.CASCADE, null=True, blank=True)
    status = models.CharField(max_length=255, verbose_name='Статус заказа', choices=STATUS_CHOICES, default=STATUS_DEFAULT)
    delivery_type = models.CharField(max_length=255, verbose_name='Тип доставки', choices=DELIVERY_TYPE_CHOICES, default=DELIVERY_TYPE_DEFAULT)

    created_time = models.DateTimeField(auto_now=True,verbose_name='Дата создания')
    order_date = models.DateField(default=timezone.now, verbose_name='Дата получения заказа')



    def __str__(self):
        return 'Заказ №%d' % (self.id)



class LatestProductManager:

    @staticmethod
    def get_products_for_main_page(*args,**kwargs):
        with_respect_to = kwargs.get('with_respect_to')
        count = kwargs.get('count')
        products = list()

        ct_models = ContentType.objects.filter(model__in=args)
        
        for i, ct_model in enumerate(ct_models):
            if count and len(count) == len(ct_models):
                model_products = ct_model.model_class()._base_manager.all().order_by('-id')[:count]
            else:
                model_products = ct_model.model_class()._base_manager.all().order_by('-id')[:5]

            products.extend(model_products)

        if with_respect_to and with_respect_to in args:
            for ct_model in ct_models:
                model_products = ct_model.model_class()._base_manager.all().order_by('-id')[:count(i)]
                products.extend(model_products)
            
            ct_models = ContentType.objects.filter(model=with_respect_to)

            if ct_models.exists():
                products = sorted(
                    products,
                    key=lambda x:x.__class__._meta.model_name.startswith(with_respect_to), reverse=True
                )

        return products


class LatestProduct:
    object = LatestProductManager()

