
import 'package:flutter/material.dart';

class HomeHistoryButtonWidget extends StatefulWidget {

  String title = '';
   HomeHistoryButtonWidget(this.title) ;

  @override
  State<HomeHistoryButtonWidget> createState() => _HomeHistoryButtonWidgetState();
}

class _HomeHistoryButtonWidgetState extends State<HomeHistoryButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(widget.title == 'Order History'){
          Navigator.pushNamed(context, '/orderHistory');
        }else{
          Navigator.pushNamed(context, '/chalanHistory');
        }
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(5,15,5,15),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.history,
                size: 55,),
              Text(widget.title,
                style: TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w400,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
