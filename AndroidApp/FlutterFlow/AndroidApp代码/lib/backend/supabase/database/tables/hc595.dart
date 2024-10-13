import '../database.dart';

class hc595Table extends SupabaseTable<hc595Row> {
  @override
  String get tableName => '74HC595';

  @override
  hc595Row createRow(Map<String, dynamic> data) => hc595Row(data);
}

class hc595Row extends SupabaseDataRow {
  hc595Row(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => hc595Table();

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  bool? get state => getField<bool>('state');
  set state(bool? value) => setField<bool>('state', value);

  bool? get isDoor => getField<bool>('is_door');
  set isDoor(bool? value) => setField<bool>('is_door', value);

  bool? get isLed => getField<bool>('is_led');
  set isLed(bool? value) => setField<bool>('is_led', value);

  bool? get isFan => getField<bool>('is_fan');
  set isFan(bool? value) => setField<bool>('is_fan', value);
}
