abstract class Favouritebuttonstate {}

class FavouriteButtoninitial extends Favouritebuttonstate {}

class FavouriteButtonUpdated extends Favouritebuttonstate {
   final bool isFavourite;

  FavouriteButtonUpdated({required this.isFavourite}); 
}
