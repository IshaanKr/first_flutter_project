import 'dart:developer';

import 'package:first_flutter_project/utils/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'config_client.dart';


class ConfigCubit extends Cubit<ConfigResponse?> {
  ConfigCubit() : super(null) {
    log('ConfigCubit() called');
    fetchConfig();
  }

  void fetchConfig() async {
    log('fetchHomeData() called');
    var res = await configApi.getConfigResponse();
    log(res.toJson().str());
    await delayApi();
    emit(res.data);
  }
}
