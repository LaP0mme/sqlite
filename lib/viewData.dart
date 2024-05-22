//this is a class to view all the data from database in a lsitview

import 'package:flutter/material.dart';
import 'package:sqlite/home.dart';
import 'package:sqlite/modelo.dart';
import 'main.dart';

class ViewData extends StatelessWidget {
  const ViewData({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Data'),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: dbHelper.queryAllRows(),
        builder: (BuildContext context,
            AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          return ListView(
            children: snapshot.data!.map((Map<String, dynamic> map) {
              return ListTile(
                title: Text('Name : ' +
                    map['name'] +
                    '          Age : ' +
                    map['age'].toString() + '          ID : ' + map['_id'].toString()),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
