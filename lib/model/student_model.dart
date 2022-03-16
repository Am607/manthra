class StudentModel {
  String? name;
  String? uuid;
  String? className;
  String? rollNo;

  StudentModel({
    required this.name,
    required this.uuid,
    required this.className,
    required this.rollNo,
  });

  Map toJson(StudentModel user) {
    var data = Map<String, dynamic>();

    data["uid"] = uuid;
    data["username"] = name;
    data["className"] = className;
    data["rollNo"] = rollNo;

    return data;
  }

  StudentModel.fromJson(Map<String, dynamic> mapData) {
    uuid = mapData["uid"];
    name = mapData["username"];
    className = mapData["className"];
    rollNo = mapData["rollNo"];
  }
}
