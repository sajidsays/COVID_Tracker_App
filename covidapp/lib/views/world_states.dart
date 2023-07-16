import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:covidapp/Utils/states_services.dart';
import 'package:covidapp/custom_widget/reusable_row.dart';
import 'package:covidapp/views/countries_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:google_fonts/google_fonts.dart';

class WorldStatesScreen extends StatefulWidget {
  const WorldStatesScreen({super.key});

  @override
  State<WorldStatesScreen> createState() => _WorldStatesScreenState();
}

class _WorldStatesScreenState extends State<WorldStatesScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
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
        backgroundColor: Colors.transparent,
        body: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            AnimatedTextKit(totalRepeatCount: 1, animatedTexts: [
              TyperAnimatedText(
                  curve: Curves.ease,
                  speed: const Duration(milliseconds: 100),
                  textAlign: TextAlign.start,
                  "COVID Tracker App",
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 250, 249, 250),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ))
            ]),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
                future: statesServices.getWorldStates(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Expanded(
                        child: SpinKitWave(
                            color: Colors.white,
                            size: 50,
                            controller: AnimationController(
                              vsync: this,
                              duration: const Duration(milliseconds: 1200),
                            )));
                  } else {
                    return Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total":
                                double.parse(snapshot.data!.cases.toString()),
                            "Recovered": double.parse(
                                snapshot.data!.recovered.toString()),
                            "Deaths":
                                double.parse(snapshot.data!.deaths.toString())
                          },
                          chartValuesOptions: const ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          animationDuration: const Duration(milliseconds: 1200),
                          chartRadius: MediaQuery.of(context).size.width / 3.2,
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left),
                          chartType: ChartType.ring,
                          colorList: const [
                            Color.fromARGB(255, 75, 0, 46),
                            Color.fromARGB(255, 1, 23, 85),
                            Color.fromARGB(255, 141, 14, 2)
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ReusableRow(
                            title: "Total Cases",
                            value: snapshot.data!.cases.toString()),
                        ReusableRow(
                            title: "Total Recovered",
                            value: snapshot.data!.recovered.toString()),
                        ReusableRow(
                            title: "Total Deaths",
                            value: snapshot.data!.deaths.toString()),
                        ReusableRow(
                            title: "Active Cases",
                            value: snapshot.data!.active.toString()),
                        ReusableRow(
                            title: "Critical Cases",
                            value: snapshot.data!.critical.toString()),
                        ReusableRow(
                            title: "Today Deaths",
                            value: snapshot.data!.todayDeaths.toString()),
                        ReusableRow(
                            title: "Today Recovered",
                            value: snapshot.data!.todayRecovered.toString()),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 40, right: 40),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const CountriesListScreen())));
                            },
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.green.shade600,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Text(
                                "Track Countries",
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                }),
          ],
        )),
      ),
    );
  }
}
