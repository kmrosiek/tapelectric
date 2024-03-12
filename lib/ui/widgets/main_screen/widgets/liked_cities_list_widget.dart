import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/features/liked_cities/liked_cities_cubit.dart';

class LikedCitiesListWidget extends StatelessWidget {
  const LikedCitiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LikedCitiesCubit, LikedCitiesState>(
      builder: (context, state) {
        return ListView(
            children: state.likedCities.map((city) {
          return Text(
              '${city.location?.name ?? ''} - ${city.current?.tempC ?? ''}°C');
        }).toList());
      },
    );
  }
}
