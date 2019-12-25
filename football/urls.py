"""coderslab URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path, re_path

from football.views import league_table, games_played, show_team_statistics, set_as_favourite, football_games, add_game, \
    modify_team

urlpatterns = [
    path('table/', league_table),
    path('', league_table),
    re_path(r'^games/(?P<game_id>(\d)+)$', games_played),
    path('stats/<int:team_id>', show_team_statistics),
    path('set_as_favourite/', set_as_favourite),

    path('football_game/', football_games, name='football_game'),
    path('add_game/', add_game, name='add_game'),
    path('modify_team/', modify_team, name='modify_team'),
]

