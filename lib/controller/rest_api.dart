import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:manthra/model/student_model.dart';

class restApi {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('students');
  CollectionReference roles = FirebaseFirestore.instance.collection('class');
  // DocumentReference docRef =
  //     FirebaseFirestore.instance.collection('users').doc();

  Future<void> addStudent({required StudentModel studentModel}) async {
    await users.doc(studentModel.uuid).set(studentModel.toJson(studentModel));
  }

  Future<StudentModel> getStudenFromDB({required String uid}) async {
    final DocumentSnapshot doc = await users.doc(uid).get();
    return StudentModel.fromJson(doc.data() as Map<String, dynamic>);
  }

  Future<List<StudentModel>> getStudentList() async {
    final userList = await users.get().then((value) {
      return value.docs
          .map((doc) =>
              StudentModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();
    });
    return userList;
  }

  Future<void> updateStudent({required StudentModel studentModel}) async {
    await users
        .doc(studentModel.uuid)
        .update(studentModel.toJson(studentModel) as Map<String, dynamic>);}

    Future<void> deleteStudent(StudentModel studentModel) async {
      return await users.doc(studentModel.uuid).delete();
    }
//! Role

    // Future<void> addRoleToDB({required RoleModel roleModel}) async {
    //   await roles.doc(roleModel.RoleId).set(roleModel.toJson(roleModel));
    // }

    // Future<RoleModel> getRoleFromDB({required roleId}) async {
    //   final DocumentSnapshot doc = await roles.doc(roleId).get();
    //   return RoleModel.fromJson(doc.data() as Map<String, dynamic>);
    // }

    // Future<List<RoleModel>> getRoleList({required String storeId}) async {
    //   final roleList =
    //       await roles.where('storeId', isEqualTo: '$storeId').get().then((value) {
    //     return value.docs
    //         .map((doc) => RoleModel.fromJson(doc.data() as Map<String, dynamic>))
    //         .toList();
    //   });
    //   return roleList;
    // }

    // Future<void> updateRole({required RoleModel roleModel}) async {
    //   await roles.doc(roleModel.RoleId).update(roleModel as Map<String, dynamic>);
    // }

    // Future<void> deleteRole({required roleId}) async {
    //   await roles.doc(roleId).delete();
    // }
  }

