import 'package:flutter/material.dart';
import 'package:study_local_data/model/inputform.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  final users = <InputForm>[];

  @override
  void dispose() {
    nameController.dispose();
    ageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(label: Text('name')),
              ),
              TextField(
                controller: ageController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(label: Text('age')),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      users.add(InputForm(
                          name: nameController.text,
                          age: int.parse(ageController.text)));
                    });
                  },
                  child: const Text('add'))
            ],
          ),
          const Divider(),
          Expanded(
              child: users.isEmpty
                  ? const Text('empty')
                  : ListView.builder(
                      itemCount: users.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(users[index].name),
                          subtitle: Text(users[index].age.toString()),
                        );
                      }))
        ],
      ),
    );
  }
}
