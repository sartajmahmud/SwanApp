import 'package:flutter/material.dart';
import 'package:swanapp/Repositories/AuthRepository.dart';
import 'package:swanapp/Widgets/HomeHistoryButtonWidget.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () async {
              // logout();
              // Navigator.pushReplacementNamed(context, '/login');
              await getUserZones();
              var x = await Navigator.pushNamed(context, '/zones');
              if (x == true) {
                setState(() {});
              }
            },
            icon: Icon(Icons.location_on)),
        title: Center(child: Text('DashBoard')),
        actions: [
          IconButton(
              onPressed: () {
                logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('assets/logo.png'),
              ),
              const SizedBox(
                height: 20,
              ),
              if (currentUser.value.address_type == '0')
                Container(
                    child: Text(
                  '${currentUser.value.currentZone} Zone ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                )),
              if (currentUser.value.address_type == '1')
                Container(
                    child: Text(
                  '${currentUser.value.currentZone} Factory',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87),
                )),
              const SizedBox(
                height: 20,
              ),
              if (currentUser.value.address_type == '0')
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/createOrder');
                  },
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
                                'Create Order',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal),
                              ))),
                          Expanded(
                              flex: 2,
                              child: Icon(
                                Icons.add_box_rounded,
                                color: Colors.green,
                                size: 35,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (currentUser.value.address_type == '0')
                    Expanded(
                        flex: 1,
                        child: HomeHistoryButtonWidget(
                            'Order History', Icons.shopping_cart_outlined)),
                  if (currentUser.value.address_type == '1')
                    Expanded(
                        flex: 1,
                        child: HomeHistoryButtonWidget(
                            'Chalaan History', Icons.inventory_outlined)),
                ],
              ),
              if (currentUser.value.address_type == '1')
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/selectChalaanInvoice');
                    },
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
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                                flex: 8,
                                child: Center(
                                    child: Text(
                                  'Create Chalaan',
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.teal),
                                ))),
                            Expanded(
                                flex: 2,
                                child: Icon(
                                  Icons.local_shipping_outlined,
                                  color: Colors.green,
                                  size: 35,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
