from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):
    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Address',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('city', models.CharField(max_length=128)),
                ('street', models.CharField(max_length=128)),
                ('home_no', models.CharField(max_length=64)),
                ('apartment_no', models.CharField(max_length=64)),
                ('zip_code', models.IntegerField(blank=True)),
            ],
        ),
        migrations.CreateModel(
            name='Email',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('email', models.CharField(max_length=64)),
                ('email_type', models.IntegerField(choices=[(0, 'Mobile'), (1, 'Home'), (2, 'Private')], default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Group',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=128, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Person',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=64)),
                ('surname', models.CharField(max_length=64)),
                ('description', models.TextField(blank=True)),
                ('photo', models.ImageField(blank=True, default='default.png', upload_to='avatar')),
            ],
        ),
        migrations.CreateModel(
            name='Phone',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('number', models.CharField(max_length=32)),
                ('number_type',
                 models.IntegerField(choices=[(0, 'Mobile'), (1, 'Home'), (2, 'Work'), (3, 'Private'), (4, 'FAX')],
                                     default=0)),
                ('person', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contacts.Person')),
            ],
        ),
        migrations.AddField(
            model_name='group',
            name='person',
            field=models.ManyToManyField(to='contacts.Person'),
        ),
        migrations.AddField(
            model_name='email',
            name='person',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contacts.Person'),
        ),
        migrations.AddField(
            model_name='address',
            name='person',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='contacts.Person'),
        ),
    ]
