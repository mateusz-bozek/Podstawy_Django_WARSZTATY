from django.http import Http404
from django.shortcuts import render
from django.db.models import Sum
from football.models import Team, Game
from football.forms import GameForm, TeamForm


def league_table(request):
    teams = Team.objects.all()
    return render(request, 'football/football_teams.html',
                  context={'teams': teams})


# zadanie 5
def games_played(request, game_id=None):
    if game_id is None:
        games_home = Game.objects.select_related('team_home') \
            .filter(team_home__name='LKS Chlebnia').values(
            'team_home__name', 'team_away__name', 'team_home_goals', 'team_away_goals')
        games_away = Game.objects.select_related('team_away') \
            .filter(team_away__name='LKS Chlebnia').values(
            'team_home__name', 'team_away__name', 'team_home_goals', 'team_away_goals')
        return render(request, 'football/football_teams.html',
                      context={'games_home': games_home, 'games_away': games_away})
    else:
        games_home = Game.objects.select_related('team_home') \
            .filter(team_home__id=game_id).values('team_home__name',
                                                  'team_away__name',
                                                  'team_home_goals',
                                                  'team_away_goals')
        games_away = Game.objects.select_related('team_away') \
            .filter(team_away__id=game_id).values('team_home__name',
                                                  'team_away__name',
                                                  'team_home_goals',
                                                  'team_away_goals')

        return render(request, 'football/football_teams.html',
                      context={'games_home': games_home, 'games_away': games_away})


def show_team_statistics(request, team_id):
    team = Team.objects.get(pk=team_id)
    games_home = Game.objects.filter(team_home=team)
    games_count_home = games_home.count()
    lost_points_home = games_home.aggregate(Sum('team_away_goals'))
    gain_points_home = games_home.aggregate(Sum('team_home_goals'))
    games_away = Game.objects.filter(team_away=team)
    games_count_away = games_away.count()
    lost_points_away = games_away.aggregate(Sum('team_home_goals'))
    gain_points_away = games_away.aggregate(Sum('team_away_goals'))

    return render(request, 'football/stats.html',
                  {'team': team,
                   'games_count_home': games_count_home,
                   'lost_points_home': lost_points_home,
                   'gain_points_home': gain_points_home,
                   'games_count_away': games_count_away,
                   'lost_points_away': lost_points_away,
                   'gain_points_away': gain_points_away,
                   })


def set_as_favourite(request):
    team_id = request.GET.get('id')

    if team_id is not None:
        team_id = int(team_id)
        if isinstance(team_id, int):
            f_team = Team.objects.filter(id=team_id)
            if f_team.count() != 0:
                response = render(request, 'football/set_as_favourite.html', {'team': f_team})
                response.set_cookie('f_team', team_id)
                return response
            else:
                raise Http404("Team not found")
        else:
            raise Http404("it is not a number")
    else:
        raise Http404("Poll does not exist")


# Dzień 3 : Zadanie 3, 4, 5

def football_games(request):
    if request.session.get('team_home'):
        n = request.session.get('team_home', False)
        empty_form = GameForm(initial={'team_name': request.session['team_home']})
        return render(request, 'football/football_game.html', {'form': empty_form, 'f': f'sesja pelna {n}'})
    else:
        n = request.session.get('team_home', False)
        empty_form = GameForm()
        return render(request, 'football/football_game.html', {'form': empty_form, 'f': f'sesja pusta {n}'})


def add_game(request):
    if request.method == 'POST':
        returned_form = GameForm(request.POST)
        if returned_form.is_valid():
            # Zadanie 3
            team_home_name = Team.objects.get(pk=request.POST['team_home'])
            team_away_name = Team.objects.get(pk=request.POST['team_away'])
            team_home_goals = request.POST['team_home_goals']
            team_away_goals = request.POST['team_away_goals']
            game = Game(
                team_home=team_home_name,
                team_away=team_away_name,
                team_home_goals=team_home_goals,
                team_away_goals=team_away_goals)
            if 'team_home' not in request.session:
                request.session['team_home'] = team_home_name.name
            # Zadanie 4
            if team_home_goals > team_away_goals:
                team_home_name.points += 3
                team_home_name.save()
            elif team_home_goals < team_away_goals:
                team_away_name.points += 3
                team_away_name.save()
            else:
                team_home_name.points += 1
                team_home_name.save()
                team_away_name.points += 1
                team_away_name.save()
            return render(request, 'football/result.html', {'form_dictionary': returned_form, 'thn': 'baza zapisana'})
    else:
        return football_games(request)


# Zadanie 5
def modify_team(request):
    if request.method == 'POST':
        returned_form = TeamForm(request.POST)
        if returned_form.is_valid():
            empty_form = TeamForm()
            team_name = request.POST['team_name']
            team_points = request.POST['points']
            team_update = Team.objects.get(pk=team_name)
            team_update.points += int(team_points)
            team_update.save()
            return render(request, 'football/football_team.html',
                          {'form': empty_form, 'message': 'baza nadpisana'})
    else:
        empty_form = TeamForm()
        return render(request, 'football/football_team.html', {'form': empty_form})
