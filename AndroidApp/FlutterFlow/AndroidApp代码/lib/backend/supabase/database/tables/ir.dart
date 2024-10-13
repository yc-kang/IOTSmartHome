import '../database.dart';

class IrTable extends SupabaseTable<IrRow> {
  @override
  String get tableName => 'ir';

  @override
  IrRow createRow(Map<String, dynamic> data) => IrRow(data);
}

class IrRow extends SupabaseDataRow {
  IrRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IrTable();

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  bool? get dataField => getField<bool>('data');
  set dataField(bool? value) => setField<bool>('data', value);
}
