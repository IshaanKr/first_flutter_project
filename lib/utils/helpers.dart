import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:first_flutter_project/config/config_client.dart';
import 'package:first_flutter_project/home_screen/home_screen.dart';
import 'package:first_flutter_project/home_screen/rest_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../configuration.dart';
import '../loader/tata_play_loader.dart';

const isDebug = kDebugMode;
const tpBgDecoration = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Colors.black,
      Color.fromARGB(255, 22, 00, 46),
    ],
  ),
);

final retrofit = RestClient(dio);
final configApi = ConfigClient(dio);

final dio = Dio(
  BaseOptions(
    contentType: contentJson,
  ),
);

const contentJson = "application/json";

extension MapExtensions on Map<String, Object?> {
  String str() {
    var result = "{";

    for (var element in entries) {
      result += '"${element.key}" : ${element.value},';
    }

    result += "}";
    return result;
  }
}

typedef JSON = Map<String, Object?>;

const dummyText = Text(
  'Hello World',
  style: TextStyle(color: Colors.red),
);

const redTextStyle = TextStyle(color: Colors.red);

const whiteTextStyle = TextStyle(color: Colors.white);

const tataPlayLoading = TataPlayLoader();

const noContentToDisplayText = Text(
  'No Content to display',
  style: whiteTextStyle,
);

const emptyWidget = SizedBox.shrink();

Future<dynamic> delay(int delay) async =>
    Future.delayed(Duration(milliseconds: delay * 1000));

Future<dynamic>? delayApi() async {
  if (enableApiDelay) {
    return delay(delayApiInSeconds);
  } else {
    return null;
  }
}

void logAppStartInfo() {
  log('========BOOT-UP=========');
  log('Operating System: ${Platform.operatingSystem}');
}

const posterDivider = SizedBox(
  width: railSpacing,
);

const editorialSectionSource = "EDITORIAL";
