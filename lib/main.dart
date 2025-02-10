import 'package:app/CrudApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'StateManagementTool.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (context) => ItemProvider(),
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Crudapp()
      ),
    )
  );
}