import 'package:flutter/material.dart';
import 'package:phonebook/main.dart';

class CreateNumberPage extends StatefulWidget {
  CreateNumberPage({super.key});

  @override
  State<StatefulWidget> createState() => CreateNumberState<CreateNumberPage>();
}

class PhoneModel {
  PhoneModel({required this.name, required this.number});
  String name = '';
  String number = '';
}

class CreateNumberState<CreateNumberPage> extends State {
  final TextEditingController _inputNameController = TextEditingController();
  final TextEditingController _inputNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _inputNameController.dispose();
    _inputNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddDate'),
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: 'name'),
                  controller: _inputNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '名前を入力してください';
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'number'),
                  controller: _inputNumberController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '番号を入力してください';
                    }
                    return null;
                  })
            ],
          )),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final PhoneModel modelObject = PhoneModel(
                name: _inputNameController.text,
                number: _inputNumberController.text);
            Navigator.of(context).pop(modelObject);
          }
        },
      ),
    );
  }
}
