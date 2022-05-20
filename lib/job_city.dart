import 'package:flutter/material.dart';

import 'job_area.dart';

class JobCity extends StatefulWidget {
  const JobCity({Key? key}) : super(key: key);

  @override
  State<JobCity> createState() => _JobCityState();
}

class _JobCityState extends State<JobCity> {
  String query = "";
  List<String> itemsList = [
    "Ahmedabad",
    "Bangalore",
    "Chennai",
    "Delhi",
    "Gurgaon",
    "Mumbai",
    "Pune",
  ];
  List<String> get suggestionList => itemsList
      .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextFormField(
            onChanged: (val) => setState(() => query = val),
            decoration: const InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              hintText: "Search",
              suffixIcon: Icon(
                Icons.person,
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: suggestionList.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => JobArea(
                            jobCity: suggestionList[index].toLowerCase(),
                          )));
                },
                child: Card(
                  child: ListTile(
                    title: Text(suggestionList[index]),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
