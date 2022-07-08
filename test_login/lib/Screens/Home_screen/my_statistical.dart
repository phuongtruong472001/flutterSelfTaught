// import 'package:flutter/material.dart';

// class MyStatistical extends StatelessWidget{
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text("Thống kê"),);
//   }

// }
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarChartPage extends StatelessWidget {
  const BarChartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KindaCode.com',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: HomePage(),
    );
  }
}

// Define data structure for a bar group

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final List<UsedOfMonth> _list = [
    UsedOfMonth(month: 1, used: 180000),
    UsedOfMonth(month: 2, used: 200000),
    UsedOfMonth(month: 3, used: 900000),
    UsedOfMonth(month: 4, used: 100000),
    UsedOfMonth(month: 5, used: 180000),
    UsedOfMonth(month: 6, used: 200000),
    UsedOfMonth(month: 7, used: 850000),
    UsedOfMonth(month: 8, used: 100000),
    UsedOfMonth(month: 9, used: 180000),
    UsedOfMonth(month: 10, used: 200000),
    UsedOfMonth(month: 11, used: 400000),
    UsedOfMonth(month: 12, used: 100000)
  ];

  // Generate dummy data to feed the chart
  // final List<UsedOfMonth> _myData = List.generate(
  //     30, (index) => UsedOfMonth(x: index, y1: _list[index].used));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 500,
              //height: MediaQuery.of(context).size.height,
              child: BarChart(BarChartData(
                  borderData: FlBorderData(
                      border: const Border(
                    top: BorderSide.none,
                    right: BorderSide.none,
                    left: BorderSide(width: 1),
                    bottom: BorderSide(width: 1),
                  )),
                  groupsSpace: 10,
                  barGroups: _list
                      .map((dataItem) =>
                          BarChartGroupData(x: dataItem.month, barRods: [
                            BarChartRodData(
                                toY: dataItem.used,
                                width: 10,
                                color: Colors.amber),
                          ]))
                      .toList())),
            ),
          ),
        
      ),
    );
  }
}

class BarChartSample3 extends StatefulWidget {
  const BarChartSample3({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<BarChartSample3> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Thống kê"),),
        body: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(border: Border.all(color: Colors.black)),
              child: const Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: BarChartPage(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class UsedOfMonth {
  int month;
  double used;
  UsedOfMonth({required this.month, required this.used});
}

// class Statistical {
//   List<UsedOfMonth> list = [];
// }
