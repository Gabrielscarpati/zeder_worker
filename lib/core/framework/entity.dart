abstract class Entity<T> {
  final String id;

  Entity({required this.id});

  Map<String, dynamic> toJson();

}
