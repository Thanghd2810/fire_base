class Student {
  Student({
    required this.age,
    required this.lop,
    required this.name,
    required this.subjects,
  });

  Student.fromJson(Map<String, Object?> json)
      : this(
          subjects: (json['subjects']! as List).cast<String>(),
          age: json['likes']! as int,
          name: json['name']! as String,
          lop: json['lop']! as String,
        );

  final String lop;
  final int age;
  final String name;

  final List<String> subjects;

  Map<String, Object?> toJson() {
    return {
      'lop': lop,
      'age': age,
      'name': name,
      'subjects': subjects,
    };
  }
}
