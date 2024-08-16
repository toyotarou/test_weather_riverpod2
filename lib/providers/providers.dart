import 'package:hooks_riverpod/hooks_riverpod.dart';

enum City { paris, tunisia, usa }

///
var currentCityProvider = StateProvider<City?>((ref) {
  return null;
});

///
Future<String> getWeather({required City city}) {
  var cityMap = {
    City.paris: 'summer',
    City.tunisia: 'cold',
    City.usa: 'hot',
  };

  return Future.delayed(const Duration(seconds: 1), () {
    return cityMap[city]!;
  });
}

///
var weatherProvider = FutureProvider<String?>((ref) async {
  var city = ref.watch(currentCityProvider);

  if (city != null) {
    return getWeather(city: city);
  } else {
    return 'enter city';
  }
});
