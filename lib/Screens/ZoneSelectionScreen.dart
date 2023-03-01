import 'package:flutter/material.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';

class ZoneSelectionScreen extends StatefulWidget {
  const ZoneSelectionScreen({Key? key}) : super(key: key);

  @override
  State<ZoneSelectionScreen> createState() => _ZoneSelectionScreenState();
}

class _ZoneSelectionScreenState extends State<ZoneSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        // automaticallyImplyLeading: false,
        title: Center(child: Text('Select Address')),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: currentUser.value.zones.length, //_con.orderHistory.length,
          itemBuilder: (_, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 6),
            child: InkWell(
              onTap: () {
                bool flag = true;
                currentUser.value.currentZone == ''
                    ? flag = false
                    : flag = true;
                currentUser.value.currentZone = currentUser.value.zones[index];

                print(currentUser.value.currentZone);
                if (flag) {
                  Navigator.pop(context, true);
                } else {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 2, 10, 2),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                        offset: Offset(
                          0.0,
                          0.0,
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                            flex: 8,
                            child: Center(
                                child: Text(
                              currentUser.value.zones[index],
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal),
                            ))),
                        Expanded(
                            flex: 2,
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Colors.green,
                              size: 35,
                            ))
                      ],
                    ),
                  ),
                ),
                // child: Container(
                //   height: 50,
                //   width: MediaQuery.of(context).size.width*.8,
                //   decoration: BoxDecoration(
                //     border: Border.all(width: 1)
                //   ),
                //   child: Center(child: Text(currentUser.value.zones[index])),
                // ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
