import '../database.dart';

class LivingRoomTable extends SupabaseTable<LivingRoomRow> {
  @override
  String get tableName => 'living_room';

  @override
  LivingRoomRow createRow(Map<String, dynamic> data) => LivingRoomRow(data);
}

class LivingRoomRow extends SupabaseDataRow {
  LivingRoomRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => LivingRoomTable();

  String get name => getField<String>('name')!;
  set name(String value) => setField<String>('name', value);

  bool? get state => getField<bool>('state');
  set state(bool? value) => setField<bool>('state', value);

  int? get id => getField<int>('id');
  set id(int? value) => setField<int>('id', value);

  bool? get isLight => getField<bool>('is_light');
  set isLight(bool? value) => setField<bool>('is_light', value);

  bool? get isFan => getField<bool>('is_fan');
  set isFan(bool? value) => setField<bool>('is_fan', value);

  bool? get isDoor => getField<bool>('is_door');
  set isDoor(bool? value) => setField<bool>('is_door', value);
}
