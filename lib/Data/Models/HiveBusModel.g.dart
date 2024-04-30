// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveBusModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBusModelAdapter extends TypeAdapter<HiveBusModel> {
  @override
  final int typeId = 0;

  @override
  HiveBusModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBusModel(
      busName: fields[0] as String,
      from: fields[1] as String,
      to: fields[2] as String,
      nextStation: fields[3] as String,
      uid: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBusModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.busName)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to)
      ..writeByte(3)
      ..write(obj.nextStation)
      ..writeByte(4)
      ..write(obj.uid);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;

  Future<void> migrateV1ToV2(fromVersion, currentVersion) async {
    final box = Hive.box<HiveBusModel>("BusFavorite");
    final values = box.toMap().entries.toList(); // Get all data as key-value pairs

    for (final entry in values) {
      final key = entry.key;
      final value = entry.value;

      final migratedValue = HiveBusModel(
        busName: value.busName,
        from: value.from,
        to: value.to,
        nextStation: value.nextStation,
        uid: value.uid // Optional field with default value
      );
      await box.put(key, migratedValue); // Update the box with migrated data
    }
  }
}
