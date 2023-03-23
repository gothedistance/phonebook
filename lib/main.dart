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
  String? name = '';
  String? number = '';
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
        title: const Text('PhoneBook'),
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
                      title: Text(_phoneList[index].name ?? ''),
                      subtitle: Text(_phoneList[index].number ?? ''),
                      onTap: () async {
                        final result = await Navigator.of(context)
                            .push<PhoneModel?>(
                                MaterialPageRoute(builder: ((context) {
                          return CreateNumberPage(
                              phoneModel: _phoneList[index]);
                        })));
                        setState(() {
                          if (result != null) {
                            _phoneList[index].name = result.name;
                            _phoneList[index].number = result.number;
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
              child: Text('登録がありません。', style: TextStyle(fontSize: 20)),
            ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () async {
            final result = await Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) {
              return CreateNumberPage(
                  phoneModel: PhoneModel(name: '', number: ''));
            }));
            if (result != null) {
              setState(() {
                _phoneList.add(PhoneModel(
                  name: result?.name,
                  number: result?.number,
                ));
              });
            }
          }),
    );
  }
}
