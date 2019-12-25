from django import forms
from football.models import Team


class GameForm(forms.Form):
    team_home = forms.ModelChoiceField(Team.objects.all())
    team_home_goals = forms.IntegerField()
    team_away = forms.ModelChoiceField(Team.objects.all())
    team_away_goals = forms.IntegerField()


class TeamForm(forms.Form):
    team_name = forms.ModelChoiceField(Team.objects.all())
    points = forms.IntegerField()
