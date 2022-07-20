import 'dart:convert' as convert;
import 'dart:convert' show utf8;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:test_login/API/api.dart';
import 'package:test_login/Models/address.dart';
import 'package:test_login/Screens/Pay/pay_screen.dart';

class ChangeAddress extends StatefulWidget {
  @override
  ChangeAddressPage createState() => ChangeAddressPage();
}

class ChangeAddressPage extends State<ChangeAddress> {
  Area? _dropDownProvince;
  Area? _dropDownDistrict;
  Area? _dropDownward;
  List<Area> listProvinces = [];
  List<Area> listDistricts = [];
  List<Area> listDownward = [];
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState

    Future.delayed(Duration.zero, () async {
      await fetchAreas(API().api_Provinces, listProvinces);
      _dropDownProvince = listProvinces[0];
    });
    //fetchProvinces(API().api_Provinces);
    super.initState();
  }

  Future<void> fetchAreas(String url, List<Area> listArea) async {
    try {
      final response = await http.get(Uri.parse(url));
      var list = convert.jsonDecode(utf8.decode(response.bodyBytes));

      list = list["results"];

      //print(list);
      for (var element in list) {
        setState(() {
          listArea.add(Area.fromJson(element));
        });
      }
      print("call api successed");
    } catch (error) {
      print("lỗi rồi");
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController  detailAddress = TextEditingController();
    TextEditingController  phone = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Stack(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        const Center(
                          child: Text(
                            "Change address",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                decoration: TextDecoration.none),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(
                  height: 30,
                  child: Text("Province"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DropdownButton<Area>(
                    hint: const Text("Choose provice"),
                    items: listProvinces.map((item) {
                      return DropdownMenuItem<Area>(
                        child: Text(item.name),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _dropDownProvince = val!;
                        listDistricts = [];
                        Future.delayed(Duration.zero, () async {
                          //print(API().apiDistrict + val.code);
                          await fetchAreas(
                              API().apiDistrict + val.code, listDistricts);
                          _dropDownDistrict = listDistricts[0];
                        });
                      });
                    },
                    value: _dropDownProvince,
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("district"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DropdownButton<Area>(
                    hint: const Text("Choose provice"),
                    items: listDistricts.map((item) {
                      return DropdownMenuItem<Area>(
                        child: Text(item.name),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _dropDownDistrict = val!;
                        listDownward = [];
                        Future.delayed(Duration.zero, () async {
                          await fetchAreas(
                              API().apiCommune + val.code, listDownward);
                          // _dropDownward = listDownward[0];
                        });
                      });
                    },
                    value: _dropDownDistrict,
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Downward"),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: DropdownButton<Area>(
                    hint: const Text("Choose provice"),
                    items: listDownward.map((item) {
                      return DropdownMenuItem<Area>(
                        child: Text(item.name),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        _dropDownward = val!;
                      });
                    },
                    value: _dropDownward,
                  ),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Write detail address"),
                ),
                TextField(
                  controller: detailAddress,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 30,
                  child: Text("Phone number"),
                ),
                TextField(
                  controller: phone,
                  decoration:
                      const InputDecoration(border: OutlineInputBorder()),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 300,
                    child: CupertinoButton(
                        color: const Color.fromARGB(255, 224, 140, 80),
                        disabledColor: const Color.fromARGB(255, 214, 155, 53),
                        borderRadius: BorderRadius.circular(30),
                        onPressed: () {
                          String address =detailAddress.text+
                              "-" +
                              _dropDownward!.name +
                              "-" +
                              _dropDownDistrict!.name +
                              "-" +
                              _dropDownProvince!.name;
                          box.write("address", address);
                          box.write("phone", phone.text.toString());
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PayScreen()));
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 15,
                              //color: Colors.black,
                              decoration: TextDecoration.none),
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
