import 'dart:developer' as developer;
import 'dart:io';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/core/domain/models/home_model.dart';
import 'package:photoapp/commons/helpers/api/app_pa_api_client.dart';

abstract class AppBPStateHome {
  const AppBPStateHome();
}

class AppBPHomeInitial extends AppBPStateHome {
  const AppBPHomeInitial();
}

class AppBPHomeLoading extends AppBPStateHome {
  const AppBPHomeLoading();
}

class AppBPHomeLoaded extends AppBPStateHome {
  const AppBPHomeLoaded(this.homeModel);
  final List<HomeModel> homeModel;
}

class AppBPHomeError extends AppBPStateHome {
  const AppBPHomeError(this.message);
  final String message;
}

class AppBPNotifierHome extends StateNotifier<AppBPStateHome> {
  AppBPNotifierHome(this._appBPApiClient)
      : super(const AppBPHomeInitial());
  final AppBPApiClient _appBPApiClient;

  Future<void> getHome() async {
    try {
      final homeModel = await _appBPApiClient.getPhotos();

      state = AppBPHomeLoaded(homeModel);

    } on AppBPApiException catch (e) {
      _appBPHomeError(e.message);
      developer.log(e.message);
    } on SocketException catch (_) {
      _appBPHomeError(
          "Couldn't fetch data. Make sure you are connected to internet.");
    } catch (e) {
      _appBPHomeError(e.toString());
      developer.log(e.toString());
    }
  }

  void appBPHomeInitial() {
    state = const AppBPHomeInitial();
  }

  void _appBPHomeError(String message) {
    state = AppBPHomeError(message);
  }
}
