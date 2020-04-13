import 'dart:convert';
import 'package:covid19_statistic/models/world/data.dart';
import 'package:covid19_statistic/ui/CountryDetail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class AllReport extends StatefulWidget {
  @override
  _AllReport createState() => _AllReport();
}

class _AllReport extends State<AllReport> {
  List<Data> _data = List<Data>();
  List<Data> _allData = List<Data>();
  GlobalKey<RefreshIndicatorState> refreshKey;
  TextEditingController controller = new TextEditingController();

  Future<List<Data>> getData() async {
    final url = "https://covid19-server.chrismichael.now.sh/api/v1/AllReports";
    final response = await http.get(url);
    var data = List<Data>();

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final list = jsonData["reports"][0]["table"][0] as List;
      for (var item in list) {
        var dt = Data();
        dt.country = item["Country"];
        dt.totalCases = item["TotalCases"];
        dt.totalDeaths = item["TotalDeaths"];
        dt.totalRecovered = item["TotalRecovered"];
        dt.newCases = item["NewCases"];
        dt.newDeaths = item["NewDeaths"];
        dt.activeCases = item["ActiveCases"];
        dt.totalTests = item["TotalTests"];
        dt.continent = item["Continent"];
        dt.deaths1Mpop = item["Deaths_1M_pop"];
        dt.seriousCritical = item["Serious_Critical"];
        dt.tests1MPop = item["Tests_1M_Pop"];
        dt.totCases1MPop = item["TotCases_1M_Pop"];

        if (dt.country != "World") data.add(dt);
        // data.add(Data.fromJson(item));
      }
      data.sort((a, b) => int.parse(b.totalCases.replaceAll(',', ''))
          .compareTo(int.parse(a.totalCases.replaceAll(',', ''))));
    } else {
      throw Exception();
    }
    return data;
  }

  Future<Null> refreshList() async {
    _data = List<Data>();
    _allData = List<Data>();
    await getData().then((value) {
      setState(() {
        _data.addAll(value);
        _allData.addAll(value);
      });
    });
  }

  @override
  void initState() {
    getData().then((value) {
      setState(() {
        _data.addAll(value);
        _allData.addAll(value);
      });
    });

    controller.addListener(() {
      setState(() {
        _data = (controller.text == null || controller.text == "")
            ? _allData
            : _data
                .where((f) => f.country
                    .toLowerCase()
                    .contains(controller.text.toLowerCase()))
                .toList();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        key: refreshKey,
        onRefresh: () async {
          await refreshList();
        },
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.home,
                      color: Colors.green,
                    ),
                    onPressed: () {},
                  ),
                  CircleAvatar(
                    child: ClipRRect(
                      child:
                          Image.asset("assets/user.jpg", fit: BoxFit.contain),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300])),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey[500],
                    ),
                    suffixIcon: Icon(
                      Icons.filter_list,
                      color: Colors.lightGreen,
                    ),
                    hintText: "Nhập tên quốc gia",
                    focusColor: Colors.green),
                controller: controller,
              ),
            ),
            Container(
              width: double.infinity,
              padding:
                  EdgeInsets.only(left: 32, right: 32, top: 16, bottom: 16),
              color: Colors.grey[100],
              child: Text(
                _data.length.toString() + " kết quả được tìm thấy",
                style: TextStyle(
                    color: Colors.grey[800], fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                color: Colors.grey[100],
                child: _allData.length != 0
                    ? ListView.separated(
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              GestureDetector(
                                child: Row(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Icon(
                                        Icons.arrow_right,
                                        color: index % 2 == 0
                                            ? Colors.grey[400]
                                            : Colors.redAccent,
                                      ),
                                      onPressed: () {},
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            _data[index].country,
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey[800],
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Bị nhiễm: ",
                                                      style: TextStyle(
                                                          color: Colors
                                                              .yellow[800]),
                                                    ),
                                                    Text(
                                                      _data[index].totalCases !=
                                                              ""
                                                          ? _data[index]
                                                              .totalCases
                                                          : 0,
                                                      style: TextStyle(
                                                          color: Colors
                                                              .yellow[800]),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Tử vong: ",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                    Text(
                                                      _data[index].totalDeaths ==
                                                              ""
                                                          ? "0"
                                                          : _data[index]
                                                              .totalDeaths,
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          Container(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Row(
                                                  children: <Widget>[
                                                    Text(
                                                      "Đã khỏi: ",
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                    Text(
                                                      _data[index].totalRecovered ==
                                                              ""
                                                          ? "0"
                                                          : _data[index]
                                                              .totalRecovered,
                                                      style: TextStyle(
                                                          color: Colors.green),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CountryDetail(_data[index]),
                                  ));
                                },
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) => Divider(),
                        itemCount: _data.length)
                    : Center(
                        child: Loading(
                          indicator: BallPulseIndicator(),
                          size: 100.0,
                          color: Colors.green,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
      //end column
    );
  }
}
