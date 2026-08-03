// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class HiveTodoAdapter extends TypeAdapter<HiveTodo> {
  @override
  final typeId = 0;

  @override
  HiveTodo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTodo(
      id: fields[0] as String,
      text: fields[1] as String,
      isCompleted: fields[2] as bool,
      projectId: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTodo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isCompleted)
      ..writeByte(3)
      ..write(obj.projectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class HiveProjectAdapter extends TypeAdapter<HiveProject> {
  @override
  final typeId = 1;

  @override
  HiveProject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProject(id: fields[0] as String, name: fields[1] as String);
  }

  @override
  void write(BinaryWriter writer, HiveProject obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
