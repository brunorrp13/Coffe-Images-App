import 'dart:html';

import 'package:coffe_pictures_assessment/services/coffe_images_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CoffeImagesService? _service;
  int _counter = 0;
  File? _storedImage;

  void _getImage() {
    _service = CoffeImagesService();
    _service!.getCoffeImage('/random');
    setState(() {
      _storedImage = _service;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              Container(
                width: 150,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                _storedImage != null
                    ? Image.file(
                        _storedImage,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      )
                    : Text(
                        'No Image Taken',
                        textAlign: TextAlign.center,
                      ),
                alignment: Alignment.center,
              ),
              ElevatedButton(
                  onPressed: () {
                    _getImage();
                  },
                  child: Text("Load coffe image")),
              ElevatedButton(onPressed: () {}, child: Text("Save image"))
            ],
          ),
        ));
  }
}
