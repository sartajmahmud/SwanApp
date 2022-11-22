
import 'package:flutter/material.dart';
import 'package:swanapp/Widgets/HomeHistoryButtonWidget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(child: Text('Dashboard')),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pushNamed(context, '/createOrder');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(15)),

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            flex: 8,
                              child: Center(child: Text('Create Order',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold
                              ),))),
                          Expanded(
                            flex: 2,
                              child: Icon(Icons.add_box_outlined,
                              size: 35,))
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                        child: HomeHistoryButtonWidget('Order History')),
                    Expanded(
                      flex: 1,
                        child: HomeHistoryButtonWidget('Chalaan History')),
                  ],
                ),

              ],
            ),
          ),
      ),
    );
  }
}
