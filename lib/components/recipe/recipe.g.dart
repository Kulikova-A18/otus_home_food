// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// =============== hive ==================
// hive
@HiveType(typeId: 1)
class Person {
  Person({
    required this.id,
    required this.name,
    required this.photo,
    required this.instructions,
  });

  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(3)
  String photo;

  @HiveField(4)
  String instructions;

  @override
  String toString() {
    return '\n ============printtoHive=========== \n id: $id\n name: $name\n photo: $photo\n';
  }
}

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final typeId = 0;

  @override
  Person read(BinaryReader reader) {
    return reader.read();
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer.write(obj.id);
    writer.write(obj.name);
    writer.write(obj.photo);
    writer.write(obj.instructions);
  }
}
