# Generated by Django 3.2 on 2021-04-25 07:29

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('web', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='powerbank',
            name='category',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='web.category', verbose_name='Категория'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='powerbank',
            name='description',
            field=models.TextField(default=1, verbose_name='Описание'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='powerbank',
            name='image',
            field=models.ImageField(default=1, upload_to='', verbose_name='Изображение'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='powerbank',
            name='price',
            field=models.DecimalField(decimal_places=2, default=1, max_digits=9, verbose_name='Цена'),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='powerbank',
            name='slug',
            field=models.SlugField(default=1, unique=True),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='powerbank',
            name='title',
            field=models.CharField(default=1, max_length=250, verbose_name='Название'),
            preserve_default=False,
        ),
    ]
