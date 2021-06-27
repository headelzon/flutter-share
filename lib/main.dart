import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/main_cubit.dart';
import 'package:my_app/share_file.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(title: 'Flutter Demo', home: _buildContent(context));
  }

  Widget _buildContent(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MainCubit(),
      child: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(middle: Text('Flutter Demo')),
          child: ShareFile()),
    );
  }
}
