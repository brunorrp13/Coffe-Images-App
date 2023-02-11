import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_bloc.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_events.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_state.dart';
import 'package:coffe_pictures_assessment/model/image_model.dart';
import 'package:coffe_pictures_assessment/repository/coffe_images_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:coffe_pictures_assessment/home_page.dart';
import 'package:mockito/mockito.dart';

class CoffeImagesRepositoryMock extends Mock implements CoffeImagesRepository {}

void main() {
  late CoffeImagesBloc coffeImagesBloc;
  late CoffeImagesRepository coffeImagesRepositoryMock;
  late MyImage img;

  setUpAll(() {
    coffeImagesRepositoryMock = CoffeImagesRepositoryMock();
    coffeImagesBloc = CoffeImagesBloc(repository: coffeImagesRepositoryMock);
  });

  testWidgets('Check buttons', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home:
            BlocProvider.value(value: coffeImagesBloc, child: const HomePage()),
      ),
    );
    expect(find.byKey(const Key("getImage")), findsOneWidget);
    expect(find.byKey(const Key("saveImage")), findsOneWidget);
  });
}
