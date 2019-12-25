from django.contrib import admin

from exercises.models import Band, Person, Category, Article, Album


# admin.site.register(Band)
@admin.register(Band)
class BandAdmin(admin.ModelAdmin):
    list_display = ('name', 'year')


# https://docs.djangoproject.com/en/2.2/ref/contrib/admin/


@admin.register(Person)
class PersonAdmin(admin.ModelAdmin):
    list_display = ('name', 'surname', 'birth_year', 'email')


@admin.register(Category)
class CategoryAdmin(admin.ModelAdmin):
    list_display = ('name',)


@admin.register(Article)
class ArticleAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'date_added', 'status', 'release_start_date', 'release_end_date')


@admin.register(Album)
class AlbumAdmin(admin.ModelAdmin):
    list_display = ('title', 'release_year', 'rating')
