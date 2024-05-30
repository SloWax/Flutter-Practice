class Performance {
  int id = 0;
  String date = '';
  String description = '';
  int duration = 0;

  Performance(this.id, this.date, this.description, this.duration);

  Performance.fromJson(Map<String, dynamic> performanceMap) {
    id = performanceMap['id'];
    date = performanceMap['date'];
    description = performanceMap['description'];
    duration = performanceMap['duration'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'description': description,
      'duration': duration
    };
  }
}