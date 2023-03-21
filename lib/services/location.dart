// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;
  Location({
    this.latitude,
    this.longitude,
  });

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.unableToDetermine) {
        await Geolocator.requestPermission();
      }
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
