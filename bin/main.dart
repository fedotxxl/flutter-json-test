import 'package:dart_json_mapper/dart_json_mapper.dart';

import 'domain/charging_point.dart';
import 'domain/station.dart';
import 'json.dart';
import 'main.reflectable.dart' show initializeReflectable;

Future<void> main() async {

  initializeReflectable();

  JsonMapper().useAdapter(JsonMapperAdapter(
    valueDecorators: {
      typeOf<List<ChargingPoint>>(): (value) => value.cast<ChargingPoint>(),
    },
    converters: {
      PlugType: JsonEnumConverterNumeric(PlugType.values),
      ChargingPointStatus: JsonEnumConverterString(ChargingPointStatus.values),
    },
  ));

  final json = '{"id":"abc","name":"123","active":true,"lat":44.1,"lon":10.2,"chargers":[{"id":"abc","name":"123","type":2,"status":"unavailable","fastCharge":false,"chargingFee":1.5,"pricePerKwh":0.5,"pricePerHour":0.3,"currency":"EUR"}]}';
  final station = JsonMapper.deserialize<Station>(json);

  print(station.chargers[0].status);

}
