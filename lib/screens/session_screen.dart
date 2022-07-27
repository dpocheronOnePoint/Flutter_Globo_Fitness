import 'package:flutter/material.dart';
import '../data/Helpers/sp_helper.dart';
import '../data/models/session.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({Key? key}) : super(key: key);

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  final TextEditingController txtDescriptionController =
      TextEditingController();
  final TextEditingController txtDurationController = TextEditingController();
  final SPHelper spHelper = SPHelper();

  @override
  void initState() {
    spHelper.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yout trainning session')),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showSessionDialog(context);
        },
      ),
    );
  }

  Future<dynamic> showSessionDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (BuildContext contex) {
          return AlertDialog(
            title: const Text('Insert the trainning session'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: txtDescriptionController,
                    decoration: const InputDecoration(hintText: 'Description'),
                  ),
                  TextField(
                    controller: txtDurationController,
                    decoration: const InputDecoration(hintText: 'Duration'),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  txtDescriptionController.text = '';
                  txtDurationController.text = '';
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: saveSession,
                child: const Text('Save'),
              )
            ],
          );
        });
  }

  Future saveSession() async {
    DateTime now = DateTime.now();
    String today = '${now.year}-${now.month}-${now.day}';
    Session newSession = Session(1, today, txtDescriptionController.text,
        int.tryParse(txtDurationController.text) ?? 0);
    spHelper.writeSession(newSession);
    txtDescriptionController.text = '';
    txtDurationController.text = '';
    Navigator.pop(context);
  }
}
