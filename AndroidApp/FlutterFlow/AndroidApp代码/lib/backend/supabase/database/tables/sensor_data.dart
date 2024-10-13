import '../database.dart';

class SensorDataTable extends SupabaseTable<SensorDataRow> {
  @override
  String get tableName => 'sensor_data';

  @override
  SensorDataRow createRow(Map<String, dynamic> data) => SensorDataRow(data);
}

class SensorDataRow extends SupabaseDataRow {
  SensorDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => SensorDataTable();

  double? get dataField => getField<double>('data');
  set dataField(double? value) => setField<double>('data', value);

  double? get time => getField<double>('time');
  set time(double? value) => setField<double>('time', value);

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);
}
