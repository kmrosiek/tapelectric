// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:io' as _i3;

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:weathet_app/data/network/weather_api.dart' as _i5;
import 'package:weathet_app/data/repositories/weather_repository.dart' as _i6;
import 'package:weathet_app/di/di_module.dart' as _i8;
import 'package:weathet_app/features/liked_cities/liked_cities_cubit.dart'
    as _i4;
import 'package:weathet_app/features/weather/weather.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final httpClientModule = _$HttpClientModule();
    gh.lazySingleton<_i3.HttpClient>(() => httpClientModule.httpClient);
    gh.factory<_i4.LikedCitiesCubit>(() => _i4.LikedCitiesCubit());
    gh.factory<_i5.WeatherApi>(
      () => _i5.WeatherApi(client: gh<_i3.HttpClient>()),
      instanceName: 'WeatherApi',
    );
    gh.lazySingleton<_i6.WeatherRemoteDataSource>(() =>
        _i6.WeatherRemoteDataSource(
            weatherApi: gh<_i5.WeatherApi>(instanceName: 'WeatherApi')));
    gh.lazySingleton<_i6.WeatherRepository>(() => _i6.WeatherRepository(
        remoteDataSource: gh<_i6.WeatherRemoteDataSource>()));
    gh.factory<_i7.WeatherCubit>(
        () => _i7.WeatherCubit(repository: gh<_i6.WeatherRepository>()));
    return this;
  }
}

class _$HttpClientModule extends _i8.HttpClientModule {}
