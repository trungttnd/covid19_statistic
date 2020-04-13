import 'package:covid19_statistic/models/world/data.dart';
import 'package:flutter/material.dart';

class CountryDetail extends StatelessWidget {
  Data detail;
  CountryDetail(this.detail);
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context);
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 200,
            child: Stack(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Image.asset("assets/banner.png", fit: BoxFit.cover),
                ),
                Positioned(
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        color: Colors.green),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  top: 32,
                  left: 32,
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 32, right: 32, top: 16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: media.size.width - 64 - 48,
                              child: Text(
                                detail.country,
                                style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.grey[800],
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              detail.continent,
                              style: TextStyle(
                                color: Colors.grey[500],
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(
                              height: 16,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                        left: 32,
                        right: 32,
                        top: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Bị nhiễm: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.totalCases,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Nhiễm mới: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.newCases,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Tử vong: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.totalDeaths,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Tử vong mới: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.newDeaths,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Khỏi bệnh: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.totalRecovered,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Đang điều trị: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.activeCases,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Xét nghiệm: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.totalTests,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Số XN/1 triệu dân: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.tests1MPop,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Nghiêm trọng: ",
                                    style: TextStyle(color: Colors.grey[800],),
                                  ),
                                  Text(
                                    detail.seriousCritical,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Số ca TB/1 triệu dân: ",
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                  Text(
                                    detail.totCases1MPop,
                                    style: TextStyle(color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
