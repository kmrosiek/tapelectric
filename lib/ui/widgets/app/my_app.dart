import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathet_app/di/di.dart';
import 'package:weathet_app/features/liked_cities/liked_cities_cubit.dart';
import 'package:weathet_app/features/weather/weather.dart';
import 'package:weathet_app/ui/widgets/main_screen/main_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<WeatherCubit>()..onSubmitLocate(),
        ),
        BlocProvider(
          create: (context) => getIt<LikedCitiesCubit>(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
