// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HiveBusModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveBusModelAdapter extends TypeAdapter<HiveBusModelDTO> {
  @override
  final int typeId = 0;

  @override
  HiveBusModelDTO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveBusModelDTO(
      busName: fields[0] as String,
      from: fields[1] as String,
      to: fields[2] as String,
      nextStation: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveBusModelDTO obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.busName)
      ..writeByte(1)
      ..write(obj.from)
      ..writeByte(2)
      ..write(obj.to)
      ..writeByte(3)
      ..write(obj.nextStation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveBusModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
