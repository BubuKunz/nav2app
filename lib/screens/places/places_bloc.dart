import 'package:nav2up/common/base_bloc.dart';
import 'package:nav2up/data/model/place.dart';
import 'package:nav2up/data/repository/places_repository.dart';

class PlacesBloc extends BaseBloc {
  PlacesBloc(this._placesRepository);

  final PlacesRepository _placesRepository;

  Future<void> getPlaces() {
    showProgress();
    addStateSource<List<Place>>(_placesRepository.getPlaces(),
        onDone: () => hideProgress(), onError: (e) => handleError(e));
  }
}
