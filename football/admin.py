from django.contrib import admin

# Register your models here.
from football.models import Game, Team

admin.site.register(Game)
admin.site.register(Team)
