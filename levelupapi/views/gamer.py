"""View module for handling requests about games"""
from django.core.exceptions import ValidationError
from rest_framework import status
from django.http import HttpResponseServerError
from rest_framework.viewsets import ViewSet
from rest_framework.response import Response
from rest_framework import serializers
from rest_framework import status
from levelupapi.models import Game, GameType, Gamer


class Gamers(ViewSet):
    """Level up games"""

    def retrieve(self, request, pk=None):
        """Handle GET requests for single game

        Returns:
            Response -- JSON serialized game instance
        """
        try:
            # `pk` is a parameter to this function, and
            # Django parses it from the URL route parameter
            #   http://localhost:8000/games/2
            #
            # The `2` at the end of the route becomes `pk`
            gamer = Gamer.objects.get(pk=pk)
            serializer = GamerSerializer(game, context={'request': request})
            return Response(serializer.data)
        except Exception as ex:
            return HttpResponseServerError(ex)



# I have no idea what's going on I don't think this is even right
