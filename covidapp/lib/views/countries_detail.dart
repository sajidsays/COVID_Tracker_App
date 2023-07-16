import 'package:covidapp/custom_widget/reusable_row.dart';
import 'package:flutter/material.dart';

class CountriesDetailScreen extends StatefulWidget {
  String name, image;
  int totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  CountriesDetailScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test});

  @override
  State<CountriesDetailScreen> createState() => _CountriesDetailScreenState();
}

class _CountriesDetailScreenState extends State<CountriesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
            Color.fromARGB(255, 3, 87, 156),
            Color.fromARGB(255, 1, 87, 3),
            // Color.fromARGB(255, 172, 175, 2),
          ])),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(
            widget.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
              )),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067),
                  child: Card(
                    color: Colors.transparent,
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * .06,
                        ),
                        ReusableRow(
                            title: "Total Cases",
                            value: widget.totalCases.toString()),
                        ReusableRow(
                            title: "Total Deaths",
                            value: widget.totalDeaths.toString()),
                        ReusableRow(
                            title: "Total Recovered",
                            value: widget.totalRecovered.toString()),
                        ReusableRow(
                            title: "Active Cases",
                            value: widget.active.toString()),
                        ReusableRow(
                            title: "Critical Cases",
                            value: widget.critical.toString()),
                        ReusableRow(
                            title: "Today Recovered",
                            value: widget.todayRecovered.toString()),
                        ReusableRow(
                            title: "Test", value: widget.test.toString()),
                      ],
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
