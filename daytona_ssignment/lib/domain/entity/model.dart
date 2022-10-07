abstract class Models<T> {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json); //Map<String, dynamic>
}
