import 'package:flutter/material.dart';

class JobArea extends StatefulWidget {
  const JobArea({Key? key, required this.jobCity}) : super(key: key);
  final String jobCity;

  @override
  State<JobArea> createState() => _JobAreaState();
}

class _JobAreaState extends State<JobArea> {
  String query = "";
  Map<String, List<String>> itemsList = {
    "mumbai": [
      "Gore Gaon",
      "Andheri",
      "Borivali",
      "Bandra",
      "Vashi",
      "Vile Parle",
      "Vasai",
      "Virar",
      "Virar West",
      "Virar East",
      "Virar West",
      "Virar East",
      "Dadar",
      "Dadar West",
      "Dadar East",
      "Dadar North",
      "Dadar South",
    ],
    "pune": [
      "Kharadi",
      "Kharadi West",
      "Kharadi East",
      "Kharadi North",
      "Kharadi South",
      "Kharadi South West",
      "Kharadi South East",
      "Kharadi North West",
      "Kharadi North East",
    ],
    "ahmedabad": [
      "Ahmedabad",
      "Ahmedabad West",
      "Ahmedabad East",
      "Ahmedabad North",
      "Ahmedabad South",
      "Ahmedabad South West",
      "Ahmedabad South East",
      "Ahmedabad North West",
      "Ahmedabad North East",
    ],
    "bangalore": [
      "Bangalore",
      "Bangalore West",
      "Bangalore East",
      "Bangalore North",
      "Bangalore South",
      "Bangalore South West",
      "Bangalore South East",
      "Bangalore North West",
      "Bangalore North East",
    ],
    "chennai": [
      "Chennai",
      "Chennai West",
      "Chennai East",
      "Chennai North",
      "Chennai South",
      "Chennai South West",
      "Chennai South East",
      "Chennai North West",
      "Chennai North East",
    ],
    "delhi": [
      "Delhi",
      "Delhi West",
      "Delhi East",
      "Delhi North",
      "Delhi South",
      "Delhi South West",
      "Delhi South East",
      "Delhi North West",
      "Delhi North East",
    ],
    "gurgaon": [
      "Gurgaon",
      "Gurgaon West",
      "Gurgaon East",
      "Gurgaon North",
      "Gurgaon South",
      "Gurgaon South West",
      "Gurgaon South East",
      "Gurgaon North West",
      "Gurgaon North East",
    ],
  };
  List<String> get suggestionList => itemsList[widget.jobCity]!
      .where((item) => item.toLowerCase().startsWith(query.toLowerCase()))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12),
        child: ListView(
          children: [
            TextFormField(
              initialValue: widget.jobCity,
              decoration: const InputDecoration(
                labelText: 'Job City',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: "Job City",
                suffixIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
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
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: suggestionList.length,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop({
                          "city": widget.jobCity,
                          "area": suggestionList[index]
                        });
                        Navigator.of(context).pop({
                          "city": widget.jobCity,
                          "area": suggestionList[index]
                        });
                      },
                      child: ListTile(
                        title: Text(suggestionList[index]),
                        trailing: const Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    const Divider()
                  ],
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
