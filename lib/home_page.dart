import 'dart:io';

import 'package:coffe_pictures_assessment/bloc/coffe_images_bloc.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_events.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_state.dart';
import 'package:coffe_pictures_assessment/model/image_model.dart';
import 'package:coffe_pictures_assessment/repository/coffe_images_repository.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CoffeImagesBloc get _bloc => BlocProvider.of<CoffeImagesBloc>(context);
  CoffeImagesRepository repository = CoffeImagesRepository();
  MyImage? _image;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _builder();
  }

  BlocBuilder _builder() {
    return BlocBuilder<CoffeImagesBloc, CoffeImagesState>(
        bloc: _bloc,
        builder: (BuildContext context, CoffeImagesState state) {
          if (state is OnNoDataFound) {
            _image = null;
          }
          if (state is SuccessfullyLoadedContentState<OnImageDataFound>) {
            _image = state.content.myImage;
            _isLoading = false;
            return _content();
          }
          if (state is LoadingState) {
            _isLoading = true;
            return _content();
          }
          _isLoading = false;
          return _content();
        });
  }

  void _getImage() {
    _bloc.add(OnFindCoffeImage());
  }

  Future<void> _saveImage() async {
    if (_image == null || _image!.imageUrl.isEmpty) {
      showSnackBar('No image found');
      return;
    }
    try {
      if (Platform.isIOS) {
        await Permission.photos.request();
        PermissionStatus status = await Permission.photos.request();
        if (status == PermissionStatus.granted) {
        } else {
          showSnackBar('Error - Permission to save image denied');
          return;
        }
      } else if (Platform.isAndroid) {
        await Permission.storage.request();
        PermissionStatus status = await Permission.storage.request();
        if (status == PermissionStatus.granted) {
        } else {
          showSnackBar('Error - Permission to save image denied');
          return;
        }
      }
      await GallerySaver.saveImage(_image!.imageUrl);
      showSnackBar('Image saved!');
    } catch (e) {
      showSnackBar('Error - Image was not saved');
    }
  }

  void showSnackBar(String message) {
    var snackBar = SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      duration: const Duration(seconds: 1),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Widget _content() {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Coffe Images',
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 250,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.grey),
                ),
                alignment: Alignment.center,
                child: _isLoading
                    ? _loader()
                    : _image != null
                        ? Image.network(
                            _image!.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : const Text(
                            'No Image to be displayed',
                            textAlign: TextAlign.center,
                          ),
              ),
              ElevatedButton(
                  key: const Key("getImage"),
                  onPressed: () {
                    _getImage();
                  },
                  child: const Text("Load image")),
              ElevatedButton(
                  key: const Key("saveImage"),
                  onPressed: () {
                    _saveImage();
                  },
                  child: const Text("Save to gallery"))
            ],
          ),
        ));
  }

  Center _loader() {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.grey,
      ),
    );
  }
}
