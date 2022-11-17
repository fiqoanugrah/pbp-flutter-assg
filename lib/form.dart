import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_assignment/models/drawer.dart';

class Budget {
  String judul;
  int nominal;
  String tipe;
  DateTime date;

  Budget(this.judul, this.nominal, this.tipe, this.date);
}

List<Budget> dataBudget = <Budget>[];

class FormBudgetPage extends StatefulWidget {
  const FormBudgetPage({super.key});

  @override
  State<FormBudgetPage> createState() => _FormBudgetPageState();
}

class _FormBudgetPageState extends State<FormBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String? _judul;
  int? _nominal;
  String? jenis;
  List<String> listJenis = ['Pemasukan', 'Pengeluaran'];
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Budget"),
      ),
      drawer: DrawerApp(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: "Judul",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          onChanged: (String? value) {
                            setState(() {
                              _judul = value!;
                            });
                          },
                          onSaved: (String? value) {
                            setState(() {
                              _judul = value!;
                            });
                          },
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return 'Judul tidak boleh kosong!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 1),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: "Nominal",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onChanged: (String? value) {
                              try {
                                setState(() {
                                  _nominal = int.parse(value!);
                                });
                              } on Exception {
                                return;
                              }
                            },
                            onSaved: (String? value) {
                              setState(() {
                                _nominal = int.parse(value!);
                              });
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Nominal tidak boleh kosong!';
                              }
                              return null;
                            },
                          )),
                      SizedBox(height: 5),
                      Center(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                            hint: Container(
                              child: const Text(
                                "Pilih Jenis",
                                style: TextStyle(color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            value: jenis,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: listJenis.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                jenis = newValue!;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: 1),
                      Center(
                        child: ListTile(
                          title: Text(
                            date.toString().substring(0, 10),
                            style: TextStyle(color: Colors.blue),
                          ),
                          leading: TextButton.icon(
                            icon: const Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            label: const Text(
                              "Pilih Tanggal",
                              style: TextStyle(color: Colors.grey),
                            ),
                            onPressed: () async {
                              final DateTime? date = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2099),
                              );
                              if (date == null) {
                                return;
                              } else {
                                setState(() {
                                  this.date = date;
                                });
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      child: const Text(
                        "Simpan",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: const EdgeInsets.all(8.0),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        fixedSize: Size(80, 20),
                        alignment: Alignment.center,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (jenis == null) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 15,
                                  child: Container(
                                    child: ListView(
                                      padding: const EdgeInsets.only(
                                          top: 20, bottom: 20),
                                      shrinkWrap: true,
                                      children: <Widget>[
                                        Center(
                                          child: const Text(
                                              'Jenis tidak boleh kosong'),
                                        ),
                                        SizedBox(height: 20),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text('Kembali'),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 15,
                                child: Container(
                                  child: ListView(
                                    padding: const EdgeInsets.only(
                                        top: 20, bottom: 20),
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Center(
                                        child: const Text(
                                            'Berhasil Menambahkan Data'),
                                      ),
                                      SizedBox(height: 20),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('Kembali'),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                          dataBudget
                              .add(Budget(_judul!, _nominal!, jenis!, date));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}