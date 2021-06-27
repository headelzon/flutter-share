import 'dart:io';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitialState());

  final _fileName = 'sample.pdf';

  void downloadFile() async {
    emit(MainLoadingState());
    Future.delayed(const Duration(seconds: 1), () async {
      try {
        final _dio = Dio();
        final _path = await filePath;
        await _dio.download(
            'http://www.africau.edu/images/default/sample.pdf', _path);
        emit(MainReadyState());
      } catch (error) {
        print(error);
        emit(MainErrorState());
      }
    });
  }

  Future<String> get filePath async {
    final _pathSeparator = Platform.pathSeparator;
    final directory = await getApplicationDocumentsDirectory();
    return directory.path +
        _pathSeparator +
        'downloads' +
        _pathSeparator +
        _fileName;
  }
}
