class UserModel {
  String? email;
  String? uid;
  String? username;
  DateTime? timestamp;

  String? userType;
  String? storeId;

  UserModel(
      {required this.email,
      this.storeId,
      required this.userType,
      required this.uid,
      required this.username,
      required this.timestamp});

  Map toJson(UserModel user) {
    var data = Map<String, dynamic>();

    data["uid"] = uid;
    data["username"] = username;
    data["email"] = email;
    data["timestamp"] = timestamp;
    data["userType"] = userType;
   data["storeId"] = storeId;

    return data;
  }

  UserModel.fromJson(Map<String, dynamic> mapData) {
    uid = mapData["uid"];
    username = mapData["username"];
    email = mapData["email"];
    timestamp = mapData["timestamp"].toDate();
    userType = mapData["userType"];
    storeId = mapData["storeId"] ?? mapData["storeId"];
  }
}
