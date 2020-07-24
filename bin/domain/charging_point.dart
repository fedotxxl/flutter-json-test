import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

@jsonSerializable
class ChargingPoint {
  String id;
  String name;
  String source;
  PlugType type;
  ChargingPointStatus status;
  bool fastCharge;
}

@jsonSerializable
class ChargingPointPrice {
  double chargingFee;
  double pricePerKwh;
  double pricePerHour;
}

@jsonSerializable
enum PlugType {
  PLUG_TESLA,
  PLUG_TYPE_1,
  PLUG_TYPE_2,
  PLUG_TYPE_3,
  PLUG_CCS,
  PLUG_CHADEMO,
  PLUG_GBT,
  PLUG_TYPE_SPI,
  PLUG_TYPE_LPI,
  PLUG_TYPE_F,
  PLUG_TYPE_E,
  PLUG_TYPE_J,
  PLUG_TYPE_IEC_60309,
  PLUG_TYPE_AVCON,
  PLUG_OTHER
}

@jsonSerializable
enum ChargingPointStatus {
  available,
  charging,
  unavailable,
}
