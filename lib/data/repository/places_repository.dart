import '../model/place.dart';

class PlacesRepository {
  PlacesRepository();

  Future<List<Place>> getPlaces() async {
    final List<Place> places = List<Place>();
    places.add(Place("Mock place"));
    return places;
  }
}
