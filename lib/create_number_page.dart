import 'package:flutter/material.dart';

import 'main.dart';

class CreateNumberPage extends StatefulWidget {
  CreateNumberPage({super.key, required this.phoneModel});
  PhoneModel phoneModel;

  @override
  State<StatefulWidget> createState() => CreateNumberState();
}

class CreateNumberState extends State<CreateNumberPage> {
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
                  controller: _inputNameController
                    ..text = widget.phoneModel.name ?? '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '名前を入力してください';
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'number'),
                  controller: _inputNumberController
                    ..text = widget.phoneModel.number ?? '',
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
