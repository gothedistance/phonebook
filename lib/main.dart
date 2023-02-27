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
  PhoneModel({required this.name, required this.number});
  String name = '';
  String number = '';
}

class PhoneListPage extends StatefulWidget {
  const PhoneListPage({super.key});

  @override
  State<StatefulWidget> createState() => PhoneListState<PhoneListPage>();
}

class PhoneListState<PhoneListPage> extends State {
  List<PhoneModel> _phoneList = <PhoneModel>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PhoneBook'),
      ),
      body: _phoneList.isNotEmpty
          ? ListView.builder(
              itemCount: _phoneList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_phoneList[index].name),
                  subtitle: Text(_phoneList[index].number),
                );
              })
          : const Center(
              child: Text('登録がありません。', style: TextStyle(fontSize: 20)),
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final PhoneModel? result = await Navigator.of(context)
                .push<PhoneModel>(MaterialPageRoute(builder: (context) {
              return CreateNumberPage();
            }));
            setState(() {
              _phoneList.add(PhoneModel(
                name: result.name,
                number: result.number,
              ));
            });
          }),
    );
  }
}