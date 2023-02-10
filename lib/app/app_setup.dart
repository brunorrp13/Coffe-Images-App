import 'package:coffe_pictures_assessment/bloc/coffe_images_bloc.dart';
import 'package:coffe_pictures_assessment/home_page.dart';
import 'package:coffe_pictures_assessment/repository/coffe_images_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const _AppSetup());
}

class _AppSetup extends StatefulWidget {
  const _AppSetup({Key? key}) : super(key: key);

  @override
  State<_AppSetup> createState() => _AppSetupState();
}

class _AppSetupState extends State<_AppSetup> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CoffeImagesBloc>(
          create: (BuildContext context) => CoffeImagesBloc(
                repository: CoffeImagesRepository(),
              ))
    ], child: _content());
  }

  MaterialApp _content() {
    return MaterialApp(
        title: "Coffe Images",
        theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.blueGrey,
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green),
          fontFamily: 'Nunito',
        ),
        home: const HomePage());
  }
}
