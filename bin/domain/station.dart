import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'charging_point.dart';

@jsonSerializable
class Station {
  String id;
  String name;
  double lat;
  double lon;
  bool active;
  List<ChargingPoint> chargers;
}

@jsonSerializable
class StationListItem {
  String id;
  double lat;
  double lon;

  StationListItem({this.id, this.lat, this.lon});
}
