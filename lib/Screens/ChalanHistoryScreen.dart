
import 'package:flutter/material.dart';

class ChalanHistoryScreen extends StatefulWidget {
  const ChalanHistoryScreen({Key? key}) : super(key: key);

  @override
  State<ChalanHistoryScreen> createState() => _ChalanHistoryScreenState();
}

class _ChalanHistoryScreenState extends State<ChalanHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chalaan History'),
      ),
    );
  }
}
