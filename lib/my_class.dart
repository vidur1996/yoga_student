class MyClass {
  final int instanceId;
  final String date;
  final String teacher;
  final String classDay;
  final String classTime;

  MyClass({
    required this.instanceId,
    required this.date,
    required this.teacher,
    required this.classDay,
    required this.classTime,
  });

  factory MyClass.fromJson(Map<String, dynamic> json) {
    return MyClass(
      instanceId: json['instanceId'],
      date: json['date'],
      teacher: json['teacher'],
      classDay: json['classDay'],
      classTime: json['classTime'],
    );
  }
}