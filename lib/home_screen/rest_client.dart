import 'package:dio/dio.dart';
import 'package:first_flutter_project/utils/helpers.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../network/endpoints.dart';

part 'rest_client.g.dart';


@RestApi(baseUrl: baseUrlUat)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET(homeScreenEndpoint)
  Future<BaseResponse<HomeScreenResponse>> getHomeScreenResponse();
}

@JsonSerializable()
class HomeScreenResponse {
  late List<Item> items;
  late int total;
  late int offset;
  late int limit;

  HomeScreenResponse(
    this.total,
    this.offset,
    this.limit,
  );

  factory HomeScreenResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeScreenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$HomeScreenResponseToJson(this);
}

@JsonSerializable()
class Item {
  late int id;
  late String title;
  late String sectionType;
  late String sectionSource;
  late String layoutType;

  @JsonKey(name: 'contentList')
  late List<Content> contents;

  Item(
    this.id,
    this.title,
    this.sectionType,
    this.sectionSource,
    this.layoutType,
    this.contents,
  );

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

enum SectionSource {
  @JsonValue(editorialSectionSource)
  editorial,
  @JsonValue('GENRE')
  genre,
  @JsonValue('DARSHAN_CHANNEL')
  darshanChannel,
  @JsonValue('BINGE_CHANNEL')
  bingeChannel,
  @JsonValue('WATCHLIST')
  watchlist,
  @JsonValue('LANGUAGE')
  language,
  @JsonValue('SHUFFLE_RAIL')
  shuffleRail,
  @JsonValue('LANGUAGE_NUDGE')
  languageNudge,
  @JsonValue('TITLE_RAIL')
  titleRail,
  @JsonValue('CATEGORY')
  category,
}

@JsonSerializable()
class Content {
  late int id;
  late String title;
  late String image;
  late String contentType;
  late String provider;

  Content(this.id, this.title, this.image, this.contentType, this.provider);

  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
  Map<String, dynamic> toJson() => _$ContentToJson(this);
}

@JsonSerializable()
class BaseResponse<T> {
  int code;
  String message;
  int status;
  @_Converter()
  T data;

  BaseResponse(this.code, this.message, this.status, this.data);

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    switch (T) {
      case HomeScreenResponse:
        return HomeScreenResponse.fromJson(json as JSON) as T;
      default:
        throw UnsupportedError('Unsupported type: $T');
    }
  }

  @override
  Object? toJson(T? object) => object;
}
