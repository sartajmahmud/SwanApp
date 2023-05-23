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
    return RefreshIndicator(
      onRefresh: () async {
        await getUserZones();
        setState(() {});
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          // automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              'Select Area',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount:
                currentUser.value.zones.length, //_con.orderHistory.length,
            itemBuilder: (_, index) => Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: InkWell(
                onTap: () {
                  bool flag = true;
                  currentUser.value.currentZone == ''
                      ? flag = false
                      : flag = true;
                  currentUser.value.currentZone =
                      currentUser.value.zones[index];

                  print(currentUser.value.currentZone);
                  if (flag) {
                    Navigator.pop(context, true);
                  } else {
                    if (currentUser.value.address_type == '1')
                      Navigator.pushReplacementNamed(
                          context, '/FactoryBottombar');
                    if (currentUser.value.address_type == '0')
                      Navigator.pushReplacementNamed(context, '/ZoneBottombar');
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 2, 15, 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 20.0,
                          offset: Offset(
                            0.0,
                            0.0,
                          ),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              flex: 9,
                              child: Center(
                                  child: Text(
                                currentUser.value.zones[index],
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87),
                              ))),
                          Expanded(
                              flex: 1,
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
      ),
    );
  }
}
