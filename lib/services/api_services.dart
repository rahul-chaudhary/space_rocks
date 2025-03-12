import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';
import 'package:space_rocks/models/rocket_model.dart';

typedef FutureEither<T> = Future<Either<Exception, T>>;
final String _rocketsURL = 'https://api.spacexdata.com/v4/rockets';
final String _rocketDetailsURL = 'https://api.spacexdata.com/v4/rockets/';
final Duration _timeoutDuration = const Duration(seconds: 10);

Future<RocketList> fetchRockets() async {
  final dio = Dio();
  final response = await dio.get('https://api.spacexdata.com/v4/rockets').timeout(_timeoutDuration);
  if (response.statusCode == 200) {
    return RocketList.fromJson(response.data);
  } else {
    throw HttpException('Failed to load rockets');
  }
}