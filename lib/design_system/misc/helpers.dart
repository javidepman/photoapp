import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:photoapp/design_system/design/app_pa_color.dart';


Size displaySize(BuildContext context) {
  debugPrint('Size = ' + MediaQuery.of(context).size.toString());
  return MediaQuery.of(context).size;
}

double displayHeight(BuildContext context) {
  debugPrint('Height = ' + displaySize(context).height.toString());
  return displaySize(context).height;
}

double displayWidth(BuildContext context) {
  debugPrint('Width = ' + displaySize(context).width.toString());
  return displaySize(context).width;
}

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    Key? key,
    this.value,
    required this.data,
    this.error,
    this.loading,
  }) : super(key: key);
  final AsyncValue<T>? value;
  final Widget Function(T) data;
  final Widget Function(Object, StackTrace?)? error;
  final Widget Function()? loading;

  @override
  Widget build(BuildContext context) {
    return value!.when(
      data: data,
      error: error ?? (e, _) => const SizedBox.shrink(),
      loading: loading ??
          () => const Material(
                child: Center(
                  child: SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: CircularProgressIndicator(
                      color: AppPAColor.primaryBlue,
                      valueColor: AlwaysStoppedAnimation<Color>(
                          AppPAColor.primaryLightGray),
                    ),
                  ),
                ),
              ),
    );
  }
}
