# Generated by Django 3.2 on 2021-04-25 06:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion
import django.utils.timezone


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('contenttypes', '0002_remove_content_type_name'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_products', models.PositiveIntegerField(default=0)),
                ('in_order', models.BooleanField(default=False)),
                ('for_anonymous_user', models.BooleanField(default=False)),
                ('final_price', models.DecimalField(decimal_places=2, default=0, max_digits=9, verbose_name='Общая цена')),
            ],
            options={
                'verbose_name': 'корзина',
                'verbose_name_plural': 'Корзины',
            },
        ),
        migrations.CreateModel(
            name='Category',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=200, verbose_name='Название')),
                ('slug', models.SlugField(unique=True)),
            ],
            options={
                'verbose_name': 'категория',
                'verbose_name_plural': 'Категории',
            },
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('phone', models.CharField(max_length=255, verbose_name='Номер телефона')),
                ('address', models.CharField(max_length=255, verbose_name='Адрес')),
            ],
            options={
                'verbose_name': 'Покупатель',
                'verbose_name_plural': 'Покупатели',
            },
        ),
        migrations.CreateModel(
            name='PowerBank',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('battery_capacity', models.PositiveIntegerField(verbose_name='Ёмоксть батарей: Ma/h')),
                ('outputs', models.CharField(choices=[('micro_usb', 'micro USB'), ('type_c', 'USB Type-C'), ('lightning', 'Lightning'), ('usb_a', 'USB A')], default='micro_usb', max_length=255, verbose_name='Разъемы')),
                ('quick_charge', models.BooleanField(default=False, verbose_name='Поддержка быстрой зарядки')),
            ],
            options={
                'verbose_name': 'Внешний аккумулятор',
                'verbose_name_plural': 'Внешние аккумуляторы',
            },
        ),
        migrations.CreateModel(
            name='Smartphone',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(unique=True)),
                ('title', models.CharField(max_length=250, verbose_name='Название')),
                ('description', models.TextField(verbose_name='Описание')),
                ('price', models.DecimalField(decimal_places=2, max_digits=9, verbose_name='Цена')),
                ('image', models.ImageField(upload_to='', verbose_name='Изображение')),
                ('diagonal', models.CharField(max_length=250, verbose_name='Диагональ')),
                ('display_type', models.CharField(max_length=250, verbose_name='Тип дисплея')),
                ('resolution', models.CharField(max_length=250, verbose_name='Разрешение экрана')),
                ('ram', models.CharField(max_length=250, verbose_name='Оперативная память')),
                ('accum_volume', models.CharField(max_length=250, verbose_name='Объем батареи')),
                ('sd', models.BooleanField(default=False, verbose_name='SD карта')),
                ('sd_volume', models.CharField(blank=True, max_length=250, null=True, verbose_name='Максимальный объём sd карты')),
                ('main_cam', models.CharField(max_length=250, verbose_name='Задняя камера')),
                ('frontal_cam', models.CharField(max_length=250, verbose_name='Фронтальная камера')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.category', verbose_name='Категория')),
            ],
            options={
                'verbose_name': 'смартфон',
                'verbose_name_plural': 'Смартфоны',
            },
        ),
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(max_length=255, verbose_name='Имя')),
                ('last_name', models.CharField(max_length=255, verbose_name='Фамилия')),
                ('phone', models.CharField(blank=True, max_length=255, null=True, verbose_name='Номер телефона')),
                ('address', models.CharField(blank=True, max_length=255, null=True, verbose_name='Адресс')),
                ('status', models.CharField(choices=[('new', 'новый'), ('in_progress', 'в процессе'), ('ready', 'готов'), ('completed', 'доставлен')], default='new', max_length=255, verbose_name='Статус заказа')),
                ('delivery_type', models.CharField(choices=[('pick_up', 'самовывоз'), ('delivery', 'доставка')], default='pick_up', max_length=255, verbose_name='Тип доставки')),
                ('created_time', models.DateTimeField(auto_now=True, verbose_name='Дата создания')),
                ('order_date', models.DateField(default=django.utils.timezone.now, verbose_name='Дата получения заказа')),
                ('cart', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='web.cart', verbose_name='Корзина')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.customer', verbose_name='Покупатель')),
            ],
            options={
                'verbose_name': 'Заказ',
                'verbose_name_plural': 'Заказы',
            },
        ),
        migrations.CreateModel(
            name='Notebook',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(unique=True)),
                ('title', models.CharField(max_length=250, verbose_name='Название')),
                ('description', models.TextField(verbose_name='Описание')),
                ('price', models.DecimalField(decimal_places=2, max_digits=9, verbose_name='Цена')),
                ('image', models.ImageField(upload_to='', verbose_name='Изображение')),
                ('diagonal', models.CharField(max_length=250, verbose_name='Диагональ')),
                ('display_type', models.CharField(max_length=250, verbose_name='Тип дисплея')),
                ('ram', models.CharField(max_length=250, verbose_name='Оперативная память')),
                ('processor_freq', models.CharField(max_length=250, verbose_name='Частота процессора')),
                ('video', models.CharField(max_length=250, verbose_name='Видеокарта')),
                ('time_without_charge', models.CharField(max_length=250, verbose_name='Время работы аккумулятора')),
                ('os', models.CharField(max_length=250, verbose_name='Операционная система')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.category', verbose_name='Категория')),
            ],
            options={
                'verbose_name': 'ноутбук',
                'verbose_name_plural': 'Ноутбуки',
            },
        ),
        migrations.CreateModel(
            name='HeadPhones',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('slug', models.SlugField(unique=True)),
                ('title', models.CharField(max_length=250, verbose_name='Название')),
                ('description', models.TextField(verbose_name='Описание')),
                ('price', models.DecimalField(decimal_places=2, max_digits=9, verbose_name='Цена')),
                ('image', models.ImageField(upload_to='', verbose_name='Изображение')),
                ('connection_type', models.CharField(choices=[('wired', 'проводные'), ('wirelles', 'беспроводные')], default='wired', max_length=255, verbose_name='Тип подключения')),
                ('headphones_type', models.CharField(choices=[('in-ear', 'Вкладыши'), ('over_ear', 'Накладные'), ('for_gaming', 'Для геймеров')], default='in-ear', max_length=250, verbose_name='Тип наушников')),
                ('microphone', models.BooleanField(default=False, verbose_name='Микрофон')),
                ('noise_cancelling', models.CharField(choices=[('passive', 'пассивное'), ('active', 'активное')], default='passive', max_length=255, verbose_name='Шумоподавление')),
                ('category', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.category', verbose_name='Категория')),
            ],
            options={
                'verbose_name': 'Наушники',
                'verbose_name_plural': 'Наушники',
            },
        ),
        migrations.AddField(
            model_name='customer',
            name='orders',
            field=models.ManyToManyField(blank=True, null=True, related_name='orders', to='web.Order', verbose_name='Заказы покупателя'),
        ),
        migrations.AddField(
            model_name='customer',
            name='user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL, verbose_name='Пользователь'),
        ),
        migrations.CreateModel(
            name='CartProduct',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('object_id', models.PositiveIntegerField()),
                ('quantity', models.PositiveIntegerField(default=1)),
                ('final_price', models.DecimalField(decimal_places=2, default=0, max_digits=9, verbose_name='Общая цена')),
                ('cart', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.cart', verbose_name='Корзина')),
                ('content_type', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contenttypes.contenttype')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='web.customer', verbose_name='Покупатель')),
            ],
            options={
                'verbose_name': 'продукт',
                'verbose_name_plural': 'Продукты корзин',
            },
        ),
        migrations.AddField(
            model_name='cart',
            name='owner',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='web.customer', verbose_name='Владелец'),
        ),
        migrations.AddField(
            model_name='cart',
            name='products',
            field=models.ManyToManyField(blank=True, related_name='products', to='web.CartProduct'),
        ),
    ]
