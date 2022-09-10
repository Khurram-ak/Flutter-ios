import 'package:flutter/material.dart';
import 'package:quizjets/export_files.dart';
import 'package:quizjets/models/category.dart';

class ExtractArgumentsScreen extends StatelessWidget {

  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    // Extract the arguments from the current ModalRoute
    // settings and cast them as ScreenArguments.
    final args = ModalRoute.of(context).settings.arguments as Category;

    return Scaffold(
     
      body: Center(
        child: Text('$args'),
      ),
    );
  }
}