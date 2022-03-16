import 'package:flutter/cupertino.dart';
import 'package:manthra/controller/rest_api.dart';

import '../model/student_model.dart';

class DataProvider extends ChangeNotifier {
  late StudentModel _student;
  StudentModel get getUser => _student;

  bool isLoading = false;
  // get isLoading => _isLoading;

  late List<StudentModel> _studentList;

  List<StudentModel> get getStudentList => _studentList;

  Future<void> addUser(StudentModel user) async {
    restApi().addStudent(studentModel: user);
  }

  Future<void> seUser(String uuid) async {
    isLoading = true;
    await restApi().getStudenFromDB(uid: uuid).then((value) {
      _student = value;
      print(value.uuid);
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> seStudentList() async {
    isLoading = true;
    restApi().getStudentList().then((value) {
      _studentList = value;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> updateStudent(StudentModel studentModel) async {
    isLoading = true;
    await restApi().updateStudent(studentModel: studentModel).then((value) {
      isLoading = false;
    });
  }

  Future<void> deleteUser(StudentModel studentModel) async {
    return await restApi().deleteStudent(studentModel);
  }

// //! Role Logic

//   List<RoleModel>? _roleList;
//   get getRoleList => _roleList;

//   RoleModel? _roleData;
//   get getRoleModel => _roleData;

//   void addRole(RoleModel roleModel) async {
//     await restApi().addRoleToDB(roleModel: roleModel).then((value) {});
//   }

//   Future<void> seRole(String roleId) async {
//     isLoading = true;
//     await restApi().getRoleFromDB(roleId: roleId).then((value) {
//       _roleData = value;
//       isLoading = false;
//       notifyListeners();
//     });
//   }

//   Future<void> seRoleList(String storeId) async {
//     isLoading = true;
//     await restApi().getRoleList(storeId: storeId).then((value) {
//       _roleList = value;
//       isLoading = false;
//       notifyListeners();
//     });
//   }

//   void updateRole(RoleModel roleModel) async {
//     isLoading = true;
//     await restApi().updateRole(roleModel: roleModel).then((value) {
//       isLoading = false;
//     });
//   }

//   void deleteRole(String roleId) async {
//     await restApi().deleteRole(roleId: roleId);
//   }
}
