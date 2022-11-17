import 'package:flutter_assignment/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/form.dart';

class DataBudgetPage extends StatefulWidget {
  const DataBudgetPage({super.key});

  @override
  State<DataBudgetPage> createState() => _MyDataState();
}

class _MyDataState extends State<DataBudgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Budget Data"),
        ),
        drawer: DrawerApp(),
        body: ListView.builder(
          itemCount: dataBudget.length,
          itemBuilder: (context, index) {
            final item = dataBudget[index];
            return Card(
              child: ListTile(
                title: Text(
                  item.judul,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.nominal.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        item.date.toString().substring(0, 10),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      Text(
                        item.tipe,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ]),
              ),
            );
          },
        ));
  }
}