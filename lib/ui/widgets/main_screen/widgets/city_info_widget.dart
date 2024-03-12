import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathet_app/common/constants/app_colors.dart';
import 'package:weathet_app/common/utils/helpers.dart';
import 'package:weathet_app/common/widgets/app_text.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/ui/widgets/main_screen/widgets/favorite_widget.dart';

class CityInfoWidget extends StatelessWidget {
  const CityInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherCubit, WeatherState>(
      builder: (context, state) {
        if (state is WeatherSearchLoading) {
          return const SpinKitCubeGrid(color: Colors.blue, size: 80);
        }
        final String? url = Helpers.makeUri(state.forecastObject);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FavoriteWidget(weatherData: state.forecastObject!),
            url != null ? Image.network(url, scale: 1.2) : const SizedBox(),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  size: 30,
                  text: '${state.forecastObject?.location?.name}',
                  isBold: FontWeight.bold,
                  color: AppColors.primaryColor,
                ),
                RotationTransition(
                  turns: AlwaysStoppedAnimation(
                      (state.forecastObject?.current?.windDegree ?? 0) / 360),
                  child: const Icon(Icons.north, color: AppColors.primaryColor),
                )
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  size: 70,
                  text: '${state.forecastObject?.current?.tempC?.round()}°',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
