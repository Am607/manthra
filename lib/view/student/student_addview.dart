import 'package:flutter/material.dart';
import 'package:manthra/controller/dataProvider.dart';
import 'package:manthra/model/student_model.dart';
import 'package:manthra/view/widgets.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class SudentAdd extends StatefulWidget {
  final bool isEdit;
  final StudentModel? studentModel;
  const SudentAdd({Key? key, this.isEdit = false, this.studentModel = null})
      : super(key: key);

  @override
  State<SudentAdd> createState() => _SudentAddState();
}

class _SudentAddState extends State<SudentAdd> {
  final _formKey = GlobalKey<FormState>();
  final uuidGenerator = Uuid();

  TextEditingController nameCont = TextEditingController();
  TextEditingController rollNo = TextEditingController();
  TextEditingController classCont = TextEditingController();

  @override
  void initState() {
    editFunction();
    super.initState();
  }

  editFunction() {
    if (widget.isEdit) {
      nameCont..text = widget.studentModel?.name ?? '';
      rollNo..text = widget.studentModel?.rollNo ?? '';
      classCont.text = widget.studentModel?.className ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: widget.isEdit ? Text('Edit Student') : Text('Student Add'),
          actions: widget.isEdit
              ? [
                  IconButton(
                      onPressed: () {
                        context
                            .read<DataProvider>()
                            .deleteUser(widget.studentModel!)
                            .then((value) async {
                          await context.read<DataProvider>().seStudentList();
                          showtoast(context, 'User Deleted Successfully');

                          Navigator.of(context).pop();
                        });
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                      ))
                ]
              : []),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                20.height,
                AppTextField(
                  controller: nameCont,
                  textFieldType: TextFieldType.NAME,
                  decoration: textInputStyle(
                      context: context, label: 'Enter student name'),
                ),
                12.height,
                AppTextField(
                  controller: rollNo,
                  textFieldType: TextFieldType.PHONE,
                  decoration: textInputStyle(
                      context: context, label: 'Enter student roll no'),
                ),
                12.height,
                AppTextField(
                  controller: classCont,
                  textFieldType: TextFieldType.NAME,
                  decoration: textInputStyle(
                      context: context, label: 'Enter student class'),
                ),
                12.height,
                AppBigButton(
                  name: widget.isEdit ? 'Student Update' : 'Student Add',
                  onPressed: widget.isEdit
                      ? () {
                          updateStudent();
                        }
                      : () {
                          addStudent();
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  addStudent() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    showtoast(context, 'Please wait...');

    final studentModel = StudentModel(
      uuid: uuidGenerator.v4(),
      name: nameCont.text,
      rollNo: rollNo.text,
      className: classCont.text,
    );
    context.read<DataProvider>().addUser(studentModel).then((value) {
      showtoast(context, 'Student added successfully');

      Navigator.pop(context);
    });
  }

  updateStudent() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    showtoast(context, 'Please wait...');

    final studentModel = StudentModel(
      uuid: widget.studentModel?.uuid,
      name: nameCont.text,
      rollNo: rollNo.text,
      className: classCont.text,
    );
    context.read<DataProvider>().updateStudent(studentModel).then((value) {
      showtoast(context, 'Student updated successfully');

      context.read<DataProvider>().seStudentList().then((value) {
        Navigator.pop(context);
      });
    });
  }
}
