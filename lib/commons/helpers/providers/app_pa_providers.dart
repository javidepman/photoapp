import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/commons/helpers/api/app_pa_api_client.dart';
import 'package:photoapp/commons/helpers/providers/home_notifier.dart';


final appBPApiClientProvider =
Provider<AppBPApiClient>((_) => AppBPApiClient());

final appBPNotifierProvider = StateNotifierProvider<AppBPNotifierHome, AppBPStateHome>(
        (ref) => AppBPNotifierHome(ref.read(appBPApiClientProvider)));

final appBPNotifierProviderHome =
StateNotifierProvider<AppBPNotifierHome, AppBPStateHome>(
      (ref) => AppBPNotifierHome(ref.read(appBPApiClientProvider)),
);