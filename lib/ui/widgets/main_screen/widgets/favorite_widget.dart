import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/data/models/weather_forecast_hourly.dart';
import 'package:weathet_app/features/liked_cities/liked_cities_cubit.dart';

class FavoriteWidget extends StatelessWidget {
  const FavoriteWidget({super.key, required this.weatherData});
  final WeatherForecastModel weatherData;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: BlocBuilder<LikedCitiesCubit, LikedCitiesState>(
        builder: (context, state) {
          final isLiked = state.likedCities
              .any((data) => data.location == weatherData.location);
          return IconButton(
              onPressed: () => context
                  .read<LikedCitiesCubit>()
                  .toggle(weatherData: weatherData),
              icon: Icon(Icons.favorite,
                  size: 40, color: isLiked ? Colors.red : Colors.grey));
        },
      ),
    );
  }
}
