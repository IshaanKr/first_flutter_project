import 'dart:developer';

import 'package:first_flutter_project/utils/helpers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rest_client.dart';

class HomeScreenCubit extends Cubit<HomeScreenResponse?> {
  HomeScreenCubit() : super(null) {
    log('HomeScreenCubit() called');
    fetchHomeData();
  }

  void fetchHomeData() async {
    log('fetchHomeData() called');
    var res = await retrofit.getHomeScreenResponse();
    log(res.toJson().str());
    await delayApi();
    emit(res.data);
  }
}
