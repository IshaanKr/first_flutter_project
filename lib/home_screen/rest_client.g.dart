// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rest_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeScreenResponse _$HomeScreenResponseFromJson(Map<String, dynamic> json) =>
    HomeScreenResponse(
      json['total'] as int,
      json['offset'] as int,
      json['limit'] as int,
    )..items = (json['items'] as List<dynamic>)
        .map((e) => Item.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$HomeScreenResponseToJson(HomeScreenResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
      'total': instance.total,
      'offset': instance.offset,
      'limit': instance.limit,
    };

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      json['id'] as int,
      json['title'] as String,
      json['sectionType'] as String,
      json['sectionSource'] as String,
      json['layoutType'] as String,
      (json['contentList'] as List<dynamic>)
          .map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sectionType': instance.sectionType,
      'sectionSource': instance.sectionSource,
      'layoutType': instance.layoutType,
      'contentList': instance.contents,
    };

Content _$ContentFromJson(Map<String, dynamic> json) => Content(
      json['id'] as int,
      json['title'] as String,
      json['image'] as String,
      json['contentType'] as String,
      json['provider'] as String,
    );

Map<String, dynamic> _$ContentToJson(Content instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image': instance.image,
      'contentType': instance.contentType,
      'provider': instance.provider,
    };

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) =>
    BaseResponse<T>(
      json['code'] as int,
      json['message'] as String,
      json['status'] as int,
      _Converter<T>().fromJson(json['data']),
    );

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'status': instance.status,
      'data': _Converter<T>().toJson(instance.data),
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RestClient implements RestClient {
  _RestClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://uat-tb.tapi.videoready.tv/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<HomeScreenResponse>> getHomeScreenResponse() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<HomeScreenResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'homescreen-client/pub/api/v1/page/DONGLE_HOMEPAGE?pageLimit=20&pageOffset=0&packName=',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<HomeScreenResponse>.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
