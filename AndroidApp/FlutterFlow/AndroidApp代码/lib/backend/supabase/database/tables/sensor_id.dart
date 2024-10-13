import '../database.dart';

class SensorIdTable extends SupabaseTable<SensorIdRow> {
  @override
  String get tableName => 'sensor_id';

  @override
  SensorIdRow createRow(Map<String, dynamic> data) => SensorIdRow(data);
}

class SensorIdRow extends SupabaseDataRow {
  SensorIdRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SensorIdTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get verify => getField<String>('verify')!;
  set verify(String value) => setField<String>('verify', value);
}
