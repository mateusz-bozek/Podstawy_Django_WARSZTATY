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
from django.conf.urls import url
from django.urls import path

from exercises.views import hello_word, show_number, show_the, show_all_bands, show_active_80s, show_the_70s, \
    show_inactive_80s, start_end, width_height, login1, login2

urlpatterns = [
    path('hello_world/', hello_word),
    path('index/<int:number>/<number2>', show_number, {"1": "one", "2": "two"}, name='index'),
    url(r'^show_the/$', show_the),
    url(r'^show_all/$', show_all_bands),
    url(r'^show_active_80s/$', show_active_80s),
    url(r'^show_the_70s/$', show_the_70s),
    url(r'^show_inactive_80s/$', show_inactive_80s),
    path('startend/', start_end),
    url(r'startend2/?$', start_end),
    path('width_height/', width_height),
    path('widthheight', width_height),
    path('login', login1),
    path('login2', login2),

]
