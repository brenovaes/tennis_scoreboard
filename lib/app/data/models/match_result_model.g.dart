// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_result_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MatchResultAdapter extends TypeAdapter<MatchResult> {
  @override
  final int typeId = 0;

  @override
  MatchResult read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MatchResult(
      fields[0] as int?,
      (fields[1] as List)
          .map((dynamic e) => (e as List).cast<String>())
          .toList(),
      (fields[2] as List)
          .map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      fields[3] as String,
      fields[4] as String,
      (fields[5] as Map).cast<String, dynamic>(),
      fields[6] as DateTime,
      (fields[7] as List).cast<int>(),
    );
  }

  @override
  void write(BinaryWriter writer, MatchResult obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.teams)
      ..writeByte(2)
      ..write(obj.sets)
      ..writeByte(3)
      ..write(obj.winner)
      ..writeByte(4)
      ..write(obj.matchDuration)
      ..writeByte(5)
      ..write(obj.stats)
      ..writeByte(6)
      ..write(obj.date)
      ..writeByte(7)
      ..write(obj.result);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MatchResultAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
