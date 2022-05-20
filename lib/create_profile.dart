import 'package:flutter/material.dart';
import 'package:phaino_it_solutions/job_city.dart';
import 'package:phaino_it_solutions/mainpage.dart';

class CreateProfile extends StatefulWidget {
  const CreateProfile({Key? key}) : super(key: key);

  @override
  State<CreateProfile> createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final TextEditingController _citycontroller = TextEditingController();
  final TextEditingController _areacontroller = TextEditingController();
  final TextEditingController _datecontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  // final TextEditingController _namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: const BackButton()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text('Lets Create Your Profile',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            Image.network("https://picsum.photos/250?image=9"),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Name',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: "Full Name",
                suffixIcon: Icon(
                  Icons.person,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _datecontroller,
              onTap: () {
                showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1950),
                        lastDate: DateTime(2050))
                    .then((value) {
                  _datecontroller.text = value.toString();
                  setState(() {});
                });
              },
              decoration: const InputDecoration(
                labelText: 'Date of Birth',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: "Date of Birth",
                suffixIcon: Icon(
                  Icons.date_range,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            DropdownButtonFormField<String>(
                items: ["Female", "Male", "Others"].map((e) {
                  return DropdownMenuItem<String>(
                    child: Text(e),
                    value: e,
                    onTap: () {},
                  );
                }).toList(),
                decoration: const InputDecoration(
                  labelText: 'Gender',
                  border: OutlineInputBorder(),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: "Gender",
                ),
                onChanged: (val) {}),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(
                        builder: (BuildContext context) => const JobCity()))
                    .then((value) {
                  _citycontroller.text = value["city"];
                  _areacontroller.text = value["area"];
                });
              },
              controller: _citycontroller,
              decoration: const InputDecoration(
                labelText: 'Job City',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: "Job City",
                suffixIcon: Icon(
                  Icons.location_city,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _areacontroller,
              decoration: const InputDecoration(
                labelText: 'Job Area',
                border: OutlineInputBorder(),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                hintText: "Job Area",
                suffixIcon: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                print("hgfd");
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => const MainPage()));
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("Submit"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
