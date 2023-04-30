import 'package:flutter/material.dart';
import 'package:phonebook/create_number_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Book',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PhoneListPage(),
    );
  }
}

class PhoneModel {
  PhoneModel(
      {required this.lastName,
      required this.lastNameKana,
      required this.firstName,
      required this.firstNameKana,
      required this.phoneNumber,
      this.email = '',
      this.description = ''});
  String lastName;
  String lastNameKana;
  String firstName;
  String firstNameKana;
  String phoneNumber;
  String? email;
  String? description;
}

class PhoneListPage extends StatefulWidget {
  const PhoneListPage({super.key});

  @override
  State createState() => PhoneListState();
}

class PhoneListState extends State {
  List<PhoneModel> _phoneList = <PhoneModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text('連絡先', style: TextStyle(color: Colors.black)),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            iconSize: 40,
            color: Colors.blue,
            onPressed: () async {
              final result = await Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) {
                return CreateNumberPage(
                  phoneModel: PhoneModel(
                      lastName: '',
                      lastNameKana: '',
                      firstName: '',
                      firstNameKana: '',
                      phoneNumber: ''),
                );
              }));
              if (result != null) {
                setState(() {
                  _phoneList.add(PhoneModel(
                      lastName: result?.lastName,
                      lastNameKana: result?.lastNameKana,
                      firstName: result?.firstName,
                      firstNameKana: result?.firstNameKana,
                      phoneNumber: result?.phoneNumber,
                      email: result?.email,
                      description: result?.description));
                });
              }
            },
          ),
        ],
      ),
      body: _phoneList.isNotEmpty
          ? ListView.builder(
              itemCount: _phoneList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                    key: UniqueKey(),
                    background: Container(
                      color: Colors.red,
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                    child: ListTile(
                      title: Text(_phoneList[index].firstName ?? ''),
                      subtitle: Text(_phoneList[index].phoneNumber ?? ''),
                      onTap: () async {
                        final result = await Navigator.of(context)
                            .push<PhoneModel?>(
                                MaterialPageRoute(builder: ((context) {
                          return CreateNumberPage(
                              phoneModel: _phoneList[index]);
                        })));
                        setState(() {
                          if (result != null) {
                            _phoneList[index].firstName = result.firstName;
                            _phoneList[index].phoneNumber = result.phoneNumber;
                          }
                        });
                      },
                    ),
                    onDismissed: (direction) {
                      setState(() {
                        _phoneList.removeAt(index);
                      });
                    });
              })
          : const Center(
              child: Text('連絡先なし', style: TextStyle(fontSize: 30)),
            ),
    );
  }
}
