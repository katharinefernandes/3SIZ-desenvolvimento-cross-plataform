class Project {
  String? title;
  String? responsable;

  Project({this.title, this.responsable});

  Project.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    title = json['responsable'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['responsable'] = responsable;
    return data;
  }
}
