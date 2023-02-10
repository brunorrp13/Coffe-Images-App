import 'package:coffe_pictures_assessment/bloc/coffe_images_bloc.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_events.dart';
import 'package:coffe_pictures_assessment/bloc/coffe_images_state.dart';
import 'package:coffe_pictures_assessment/repository/coffe_images_repository.dart';
import 'package:coffe_pictures_assessment/services/coffe_images_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CoffeImagesBloc get _bloc => BlocProvider.of<CoffeImagesBloc>(context);
  CoffeImagesRepository repository = CoffeImagesRepository();
  String? _imageUrl;
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
            _imageUrl = null;
          }
          if (state is SuccessfullyLoadedContentState<OnImageDataFound>) {
            _imageUrl = state.content.imageUrl;
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

  Widget _content() {
    return Scaffold(
        appBar: AppBar(),
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
                    : _imageUrl != null
                        ? Image.network(
                            _imageUrl!,
                            fit: BoxFit.cover,
                          )
                        : const Text(
                            'No Image to be displayed',
                            textAlign: TextAlign.center,
                          ),
              ),
              ElevatedButton(
                  onPressed: () {
                    _getImage();
                  },
                  child: const Text("Load coffe image")),
              ElevatedButton(onPressed: () {}, child: Text("Save image"))
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
