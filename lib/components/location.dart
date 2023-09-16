import 'package:geolocator/geolocator.dart';

class Location{
  double? latitude;
  double? longtitude;

  Future<void> getLocation() async {

    Position position = await _determinePosition();

    latitude=position.latitude;
    longtitude=position.longitude;


  }




  Future _determinePosition() async {

    LocationPermission permission;

    permission = await Geolocator.checkPermission();

    if(permission == LocationPermission.denied) {

      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied) {
        return Future.error('Location Permissions are denied');
      }
    }

    try {
      return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);


    }catch(e){
      print(e);
    }

  }
}