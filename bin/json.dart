import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:enum_to_string/enum_to_string.dart';

class JsonEnumConverterNumeric implements ICustomConverter {

  final List<dynamic> enumValues;

  const JsonEnumConverterNumeric(this.enumValues) : super();

  @override
  Object fromJSON(dynamic jsonValue, [JsonProperty jsonProperty]) {
    return jsonValue is int ? this.enumValues[jsonValue] : jsonValue;
  }

  @override
  dynamic toJSON(Object object, [JsonProperty jsonProperty]) {
    return this.enumValues.indexOf(object);
  }
}

class JsonEnumConverterString implements ICustomConverter {

  Map<String, dynamic> enumValuesByName;
  Map<dynamic, String> nameByEnumValues;

  JsonEnumConverterString(List<dynamic> enumValues) : super() {
    this.enumValuesByName = {};
    this.nameByEnumValues = {};

    for (var value in enumValues) {
      final name = EnumToString.parse(value);

      this.enumValuesByName[name] = value;
      this.nameByEnumValues[value] = name;
    }
  }

  @override
  Object fromJSON(dynamic jsonValue, [JsonProperty jsonProperty]) {
    print("!");
    return (jsonValue is String) ? this.enumValuesByName[jsonValue] : jsonValue;
  }

  @override
  dynamic toJSON(Object object, [JsonProperty jsonProperty]) {
    return this.nameByEnumValues[object];
  }
}
