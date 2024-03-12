part of 'liked_cities_cubit.dart';

abstract class LikedCitiesState extends Equatable {
  const LikedCitiesState(this.likedCities);
  final List<WeatherForecastModel> likedCities;

  LikedCitiesState copyWith({
    List<WeatherForecastModel>? likedCities,
  });
}

class LikedCitiesStateData extends LikedCitiesState {
  const LikedCitiesStateData({required List<WeatherForecastModel> likedCities})
      : super(likedCities);

  LikedCitiesStateData.fromState(LikedCitiesState state)
      : super(state.likedCities);
  @override
  List<Object> get props => [likedCities];

  @override
  LikedCitiesStateData copyWith({
    List<WeatherForecastModel>? likedCities,
  }) {
    return LikedCitiesStateData(
      likedCities: likedCities ?? this.likedCities,
    );
  }
}
