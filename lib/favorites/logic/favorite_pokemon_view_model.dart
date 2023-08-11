import 'package:cindy_radio/data/model/favorite_db.dart';
import 'package:cindy_radio/data/model/radio_model.dart';
import 'package:cindy_radio/data/repository/service/favorite_radio_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


///Favorite Station provider
class FavoriteStationVM extends StateNotifier<FavoriteStationState> {
  final Ref ref;
  FavoriteStationVM(this.ref) : super(const FavoriteStationInitial());

  addToFavorite({
    required String stationuuid,
    required String url,
    required String name,
    required int clickcount,
    required String country,
    required String countrycode,
    required String favicon,
    required String tags,
    int? id,
  }) {
    state = const FavoriteStationLoading();
    try {
      final result =
      ref.read(favoriteRadioStationServiceProvider).toggleFavoriteItem(
          stationuuid: stationuuid,
          url: url,
          name: name,
          clickcount: clickcount,
          country: country,
          countrycode: countrycode,
          tags: tags,
          favicon: favicon,
          id: id
      );
      state = FavoriteStationAdded(result);
    } catch (e) {
      state = FavoriteStationError(e.toString());
    }
  }
}

final favoriteStationVM =
StateNotifierProvider<FavoriteStationVM, FavoriteStationState>(
        (ref) => FavoriteStationVM(ref));

final fetchFavoriteStationVM = StreamProvider<List<FavoriteDB>>((ref) {
  final faveStations =
  ref.watch(favoriteRadioStationServiceProvider).getAllFavorites();
  return faveStations;
});
