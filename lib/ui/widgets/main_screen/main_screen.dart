import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weathet_app/common/utils/show_snack_bar.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/ui/widgets/main_screen/widgets/search_and_city_info_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<WeatherCubit, WeatherState>(
        listener: (context, state) {
          if (state is WeatherDataError) {
            SnackBarHelper.show(context, state.error);
          }
        },
        builder: (context, state) {
          if (state is WeatherCubitLoading) {
            return const Center(
              child: SpinKitCubeGrid(color: Colors.blue, size: 80),
            );
          }
          return const SearchAndCityInfoWidget();
        },
      ),
    );
  }
}
