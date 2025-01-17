import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';



class DataList extends StatelessWidget {
  Future<List<dynamic>?>? getUsers() async {
    var addr = Uri.parse("https://api.npoint.io/855119545cb31ef362a7");
    var res = await http.get(addr);

    if (res.statusCode == 200) {
      var users = jsonDecode(res.body);
      return users;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Container(
        child: FutureBuilder<List<dynamic>?>(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (c, i) {
                  var u = snapshot.data![i];
                  return Card(
                    child: ListTile(
                      tileColor: u["IsOpen"] == true ? Colors.white : Color.fromARGB(255, 234, 54, 41),
                      title: Text(u["SiteName"]),
                      subtitle: Text(u["WorkOrderNumber"]),
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}