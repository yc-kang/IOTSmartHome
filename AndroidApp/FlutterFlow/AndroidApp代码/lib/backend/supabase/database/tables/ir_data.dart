import '../database.dart';

class IrDataTable extends SupabaseTable<IrDataRow> {
  @override
  String get tableName => 'ir_data';

  @override
  IrDataRow createRow(Map<String, dynamic> data) => IrDataRow(data);
}

class IrDataRow extends SupabaseDataRow {
  IrDataRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => IrDataTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  int? get dataField => getField<int>('data');
  set dataField(int? value) => setField<int>('data', value);
}
