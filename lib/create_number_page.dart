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
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0),
            child: Container(
              color: Colors.white, // 背景色と同じにすることで線を消す
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('連絡先追加', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
          child: Column(children: [
            Container(
                alignment: Alignment.topCenter,
                child: const Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.blue,
                )),
            const Divider(
              height: 5,
              thickness: 0.3,
              color: Colors.black,
            ),
            Row(
              children: [TextField()],
            )
          ]),
        )
        /*
      Container(
        alignment: Alignment.topCenter,
        child: Icon(
          Icons.account_circle,
          size: 100,
          color: Colors.blue,
        ),
      ),
*/
/*
      Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                  decoration: const InputDecoration(labelText: 'aaaa'),
                  controller: _inputNameController
                    ..text = widget.phoneModel.firstName ?? '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '名前を入力してください';
                    }
                    return null;
                  }),
              TextFormField(
                  decoration: const InputDecoration(labelText: 'number'),
                  controller: _inputNumberController
                    ..text = widget.phoneModel.phoneNumber ?? '',
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '番号を入力してください';
                    }
                    return null;
                  })
            ],
          )),
*/
/*
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final PhoneModel modelObject = PhoneModel(
                lastName: _inputNameController.text,
                lastNameKana: '',
                firstName: '',
                firstNameKana: '',
                phoneNumber: _inputNumberController.text,
                email: '',
                description: '');
            Navigator.of(context).pop(modelObject);
          }
        },
      ),
*/
        );
  }
}
