import 'package:covidapp/Utils/states_services.dart';
import 'package:covidapp/views/countries_detail.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
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
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                controller: searchController,
                onChanged: (value) {
                  setState(() {});
                },
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:
                          const BorderSide(width: 3, color: Colors.blueAccent)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        width: 3,
                        color: Colors.white,
                      )),
                  hintText: "Search with country name",
                  hintStyle: const TextStyle(color: Colors.white),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                ),
              ),
            ),
            Expanded(
                child: FutureBuilder(
              future: statesServices.getCountiesList(),
              builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                if (!snapshot.hasData) {
                  return ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: Colors.grey.shade700,
                          highlightColor: Colors.grey.shade100,
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              CountriesDetailScreen(
                                                image: snapshot.data![index]
                                                    ["countryInfo"]["flag"],
                                                name: snapshot.data![index]
                                                    ["country"],
                                                totalCases: snapshot
                                                    .data![index]["cases"],
                                                totalRecovered: snapshot
                                                    .data![index]["recovered"],
                                                totalDeaths: snapshot
                                                    .data![index]["deaths"],
                                                active: snapshot.data![index]
                                                    ["active"],
                                                test: snapshot.data![index]
                                                    ["tests"],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ["todayRecovered"],
                                                critical: snapshot.data![index]
                                                    ["critical"],
                                              ))));
                                },
                                child: ListTile(
                                  title: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  subtitle: Container(
                                    height: 10,
                                    width: 89,
                                    color: Colors.white,
                                  ),
                                  leading: Container(
                                    height: 50,
                                    width: 50,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String countryName = snapshot.data![index]["country"];
                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              CountriesDetailScreen(
                                                image: snapshot.data![index]
                                                    ["countryInfo"]["flag"],
                                                name: snapshot.data![index]
                                                    ["country"],
                                                totalCases: snapshot
                                                    .data![index]["cases"],
                                                totalRecovered: snapshot
                                                    .data![index]["recovered"],
                                                totalDeaths: snapshot
                                                    .data![index]["deaths"],
                                                active: snapshot.data![index]
                                                    ["active"],
                                                test: snapshot.data![index]
                                                    ["tests"],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ["todayRecovered"],
                                                critical: snapshot.data![index]
                                                    ["critical"],
                                              ))));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]["country"],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "Cases : ${snapshot.data![index]["cases"].toString()}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"])),
                                ),
                              )
                            ],
                          );
                        } else if (countryName
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: ((context) =>
                                              CountriesDetailScreen(
                                                image: snapshot.data![index]
                                                    ["countryInfo"]["flag"],
                                                name: snapshot.data![index]
                                                    ["country"],
                                                totalCases: snapshot
                                                    .data![index]["cases"],
                                                totalRecovered: snapshot
                                                    .data![index]["recovered"],
                                                totalDeaths: snapshot
                                                    .data![index]["deaths"],
                                                active: snapshot.data![index]
                                                    ["active"],
                                                test: snapshot.data![index]
                                                    ["tests"],
                                                todayRecovered:
                                                    snapshot.data![index]
                                                        ["todayRecovered"],
                                                critical: snapshot.data![index]
                                                    ["critical"],
                                              ))));
                                },
                                child: ListTile(
                                  title: Text(
                                    snapshot.data![index]["country"],
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  subtitle: Text(
                                    "Cases : ${snapshot.data![index]["cases"].toString()}",
                                    style: const TextStyle(color: Colors.white),
                                  ),
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ["countryInfo"]["flag"])),
                                ),
                              )
                            ],
                          );
                        } else {
                          return Container();
                        }
                      });
                }
              },
            ))
          ],
        )),
      ),
    );
  }
}
