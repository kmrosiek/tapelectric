part of weather;

abstract class WeatherState extends Equatable {
  const WeatherState({this.forecastObject});

  final WeatherForecastModel? forecastObject;
}

class WeatherCubitLoading extends WeatherState {
  const WeatherCubitLoading();

  WeatherCubitLoading.fromState(WeatherState state)
      : super(forecastObject: state.forecastObject);

  @override
  List<Object> get props => [];
}

class WeatherSearchLoading extends WeatherState {
  WeatherSearchLoading.fromState(WeatherState state)
      : super(forecastObject: state.forecastObject);

  @override
  List<Object> get props => [];
}

class WeatherDataError extends WeatherState {
  final String error;

  const WeatherDataError({required this.error});

  WeatherDataError.fromState(WeatherState state, this.error)
      : super(forecastObject: state.forecastObject);

  @override
  List<Object> get props => [error];
}

class WeatherDataLoaded extends WeatherState {
  const WeatherDataLoaded({super.forecastObject});

  @override
  List<Object?> get props => [forecastObject];
}
