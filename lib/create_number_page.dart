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
            preferredSize: const Size.fromHeight(0),
            child: Container(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text('連絡先追加', style: TextStyle(color: Colors.black)),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "姓", style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: "（必須）",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "姓フリガナ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: "（必須）",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.teal)),
                      ),
                    ),
                  )),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "名", style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: "（必須）",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 130),
                    child: RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: "名フリガナ",
                              style: TextStyle(color: Colors.black)),
                          TextSpan(
                            text: "（必須）",
                            style: TextStyle(color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Flexible(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                        decoration: const InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                    )),
                  )),
                  Flexible(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.teal)),
                          ),
                        )),
                  )
                ],
              ),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "電話番号",
                                style: TextStyle(color: Colors.black)),
                            TextSpan(
                              text: "（必須）",
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                  )),
                ))
              ]),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "メールアドレス",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                  )),
                ))
              ]),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                                text: "メモ",
                                style: TextStyle(color: Colors.black)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Row(children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 50),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal)),
                  )),
                ))
              ]),
              Row(children: [
                Flexible(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(400, 40)), // サイズを指定
                      ),
                      child: const Text('完了')),
                ))
              ]),
            ]))
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
