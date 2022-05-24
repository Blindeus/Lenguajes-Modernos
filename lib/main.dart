import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/crear_obra.dart';
import 'package:flutter_application_1/size_config.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Crear Obra',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(124, 255, 200, 0),
          leading: const Icon(Icons.arrow_back),
          title: const Text('Crear Obra'),
          centerTitle: true,
        ),
        body: SizedBox(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: getProportionatedScreenHeight(20)),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight * 0.08,
                    ),
                    Create_obra()
                  ],
                )))),
      ),
    );
  }
}
