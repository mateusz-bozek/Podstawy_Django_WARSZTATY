from django.db import models

status_choices = (
    (0, "W trakcie pisania"),
    (1, "czeka na akceptacje redaktora"),
    (2, "opublikowane")
)

rating_choice = (
    (0, "-"),
    (1, "*"),
    (2, "**"),
    (3, "***"),
    (4, "****"),
    (5, "*****"),
)


class Band(models.Model):
    NOT_DEFINED = -1
    ROCK = 0
    METAL = 1
    POP = 2
    HIP_HOP = 3
    ELECTRONIC = 4
    REGGAE = 5
    OTHER = 6
    genre_choices = (
        (NOT_DEFINED, "not defined"),
        (ROCK, "rock"),
        (METAL, "metal"),
        (POP, "pop"),
        (HIP_HOP, "hip-hop"),
        (ELECTRONIC, "electronic"),
        (REGGAE, "reggae"),
        (OTHER, "other")
    )
    name = models.CharField(max_length=64)
    year = models.IntegerField(null=True)
    still_active = models.BooleanField(default=True)
    genre = models.IntegerField(choices=genre_choices, default=NOT_DEFINED)

    def __str__(self):
        return self.name + " "


class Person(models.Model):
    name = models.CharField(max_length=64)
    surname = models.CharField(max_length=64, null=True)
    birth_year = models.IntegerField(null=True)
    email = models.EmailField(null=True)


class Category(models.Model):
    name = models.CharField(max_length=64)
    description = models.TextField(null=True)


class Article(models.Model):
    title = models.CharField(max_length=128)
    author = models.CharField(max_length=64, null=True)
    content = models.TextField()
    date_added = models.DateTimeField(auto_now_add=True)
    status = models.IntegerField(choices=status_choices)
    release_start_date = models.DateField(null=True)
    release_end_date = models.DateField(null=True)
    category = models.ManyToManyField(Category)


class Album(models.Model):
    title = models.TextField()
    release_year = models.DateField()
    rating = models.IntegerField(choices=rating_choice)
    band = models.ForeignKey(Band, on_delete=models.CASCADE, null=True)


class Song(models.Model):
    title = models.CharField(max_length=128)
    duration = models.DateTimeField(null=True)
    album = models.ForeignKey(Album, on_delete=models.CASCADE, null=True)

