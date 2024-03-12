import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weathet_app/data/models/weather_forecast_hourly.dart';

part 'liked_cities_state.dart';

@injectable
class LikedCitiesCubit extends Cubit<LikedCitiesState> {
  LikedCitiesCubit() : super(const LikedCitiesStateData(likedCities: []));

  void toggle({required WeatherForecastModel weatherData}) {
    final likedCities = List<WeatherForecastModel>.from(state.likedCities);
    bool byLocation(data) => data.location == weatherData.location;
    if (likedCities.any(byLocation)) {
      likedCities.removeWhere(byLocation);
    } else {
      likedCities.add(weatherData);
    }
    emit(LikedCitiesStateData.fromState(
        state.copyWith(likedCities: likedCities)));
  }
}
