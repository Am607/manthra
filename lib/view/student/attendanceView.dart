import 'package:flutter/material.dart';
import 'package:manthra/controller/dataProvider.dart';
import 'package:manthra/view/student/student_addview.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class StudentView extends StatefulWidget {
  const StudentView({Key? key}) : super(key: key);

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  @override
  void initState() {
    context.read<DataProvider>().seStudentList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    log('=============widget rebuilded');
    return Scaffold(
      appBar: AppBar(
        title: Text('Student View'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SudentAdd()));
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: context.watch<DataProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : context.read<DataProvider>().getStudentList.length == 0
              ? Center(
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Text(
                      'No Student Found. Please Add Student to View Student List',
                      style: TextStyle(color: Colors.black),
                    ),
                ),
              )
              : ListView.builder(
                  itemCount: context.read<DataProvider>().getStudentList.length,
                  itemBuilder: (context, index) {
                    print(context
                        .read<DataProvider>()
                        .getStudentList
                        .length
                        .toString());

                    return ListTile(
                      leading: Icon(Icons.person),
                      title: Text(
                          '${context.read<DataProvider>().getStudentList[index].name}'),
                      subtitle: Text(
                          '${context.read<DataProvider>().getStudentList[index].rollNo}'),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SudentAdd(
                                    isEdit: true,
                                    studentModel: context
                                        .read<DataProvider>()
                                        .getStudentList[index],
                                  )));
                        },
                      ),
                    );
                  }),
    );
  }
}
