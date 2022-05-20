import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> jobTitle = [
    "Software Engineer",
    "Graphic Designer",
    "Web Developer",
    "Android Developer",
    "iOS Developer",
    "Data Scientist",
    "Machine Learning Engineer",
    "Data Engineer",
    "Data Analyst",
  ];
  List selectedList = [];
  List<String> get suggestionList => jobTitle
      .where((item) =>
          item.toLowerCase().startsWith(query.toLowerCase()) ||
          item.toLowerCase().contains(query.toLowerCase()))
      .toList();

  String query = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(selectedList.isNotEmpty ? 150 : 80),
            child: SizedBox(
              height: selectedList.isNotEmpty ? 150 : 80,
              child: selectedList.isNotEmpty
                  ? ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (var i = 0; i < selectedList.length; i++)
                          Stack(alignment: Alignment.topRight,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        print("sdfg");
                                        setState(() {
                                          selectedList.remove(selectedList[i]);
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                      )),
                                ],
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectedList.remove(suggestionList[i]);
                                  });
                                },
                                child: Container(
                                  height: 150,
                                  width: 150,
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://picsum.photos/250?image=${i + 1}"))),
                                ),
                              ),
                            ],
                          )
                      ],
                    )
                  : const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                          "Lets start by Selecting Your Area of Interest",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                    ),
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 42, 130, 201),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              const Text(
                "Select Your Area of Interest",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "You have to select at least one",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) => setState(() => query = val),
                decoration: const InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Search",
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: suggestionList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if (selectedList.contains(suggestionList[index])) {
                            selectedList.remove(suggestionList[index]);
                          } else {
                            selectedList.add(suggestionList[index]);
                          }
                        });
                      },
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: GridTile(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (selectedList.contains(
                                                suggestionList[index])) {
                                              selectedList.remove(
                                                  suggestionList[index]);
                                            } else {
                                              selectedList
                                                  .add(suggestionList[index]);
                                            }
                                          });
                                        },
                                        icon: Icon(
                                          Icons.check,
                                          color: selectedList.contains(
                                                  suggestionList[index])
                                              ? Colors.green
                                              : Colors.grey,
                                        )),
                                  ],
                                ),
                                Material(
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: NetworkImage(
                                        "https://picsum.photos/250?image=${index + 1}"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(suggestionList[index]),
                              ],
                            ),
                          )),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
