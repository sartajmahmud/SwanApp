
import 'package:flutter/material.dart';

class HomeHistoryButtonWidget extends StatefulWidget {

  String title = '';
  late IconData icon ;
   HomeHistoryButtonWidget(this.title, this.icon) ;

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
        margin: const EdgeInsets.fromLTRB(7,25,5,15),
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
        height: 130,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(widget.icon,
                color: Colors.teal,
                size: 55,),
              Text(widget.title,
                style: TextStyle(
                  fontSize: 17, fontWeight: FontWeight.w400,
                ),)
            ],
          ),
        ),
      ),
    );
  }
}
