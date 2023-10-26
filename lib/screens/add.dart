import 'package:flutter/material.dart';

class Add_Screen extends StatefulWidget {
  const Add_Screen({super.key});

  @override
  State<Add_Screen> createState() => _Add_ScreenState();
}

class _Add_ScreenState extends State<Add_Screen> {
  String dropdownValue = 'male';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Container(
          color: Colors.white,
          height: 750,
          width: 380,
          child: Column(
            children: [
              CircleAvatar(
                radius: 80,
              ),
              Container(
                alignment: Alignment.topRight,
                height: 15,
                width: 100,
                color: Colors.amber,
                child: InkWell(
                  hoverColor: Colors.blue,
                  splashColor: Colors.amber,
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Add_Screen()));
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                  ),
                ),
              ),
              Text(
                "Profile",
                style: TextStyle(color: Colors.black, fontSize: 17),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 10,
                  left: 10,
                  right: 10,
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              SizedBox(
                height: 4,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 3,
                  right: 150,
                ),
                child: DropdownButton<String>(
                  value: dropdownValue,

                  items: <String>['male', 'female', 'others']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20),
                      ),
                    );
                  }).toList(),
                  // Step 5.
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
