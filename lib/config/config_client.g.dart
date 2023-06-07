// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigResponse _$ConfigResponseFromJson(Map<String, dynamic> json) =>
    ConfigResponse(
      Config.fromJson(json['config'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ConfigResponseToJson(ConfigResponse instance) =>
    <String, dynamic>{
      'config': instance.config,
    };

Config _$ConfigFromJson(Map<String, dynamic> json) => Config(
      (json['availableProviders'] as List<dynamic>)
          .map((e) => AvailableProvider.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['providerLogo'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ProviderLogo.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ConfigToJson(Config instance) => <String, dynamic>{
      'availableProviders': instance.genericPartners,
      'providerLogo': instance.providerLogos,
    };

ProviderLogo _$ProviderLogoFromJson(Map<String, dynamic> json) => ProviderLogo(
      json['providerPiPageLogo'] as String,
      json['providerRailPageLogo'] as String,
    );

Map<String, dynamic> _$ProviderLogoToJson(ProviderLogo instance) =>
    <String, dynamic>{
      'providerPiPageLogo': instance.piLogo,
      'providerRailPageLogo': instance.railLogo,
    };

AvailableProvider _$AvailableProviderFromJson(Map<String, dynamic> json) =>
    AvailableProvider(
      json['providerPiPageLogo'] as String,
      json['railPageLogo'] as String,
      json['providerName'] as String,
    );

Map<String, dynamic> _$AvailableProviderToJson(AvailableProvider instance) =>
    <String, dynamic>{
      'providerPiPageLogo': instance.piLogo,
      'railPageLogo': instance.railLogo,
      'providerName': instance.name,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ConfigClient implements ConfigClient {
  _ConfigClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://uat-tb.tapi.videoready.tv/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BaseResponse<ConfigResponse>> getConfigResponse() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<BaseResponse<ConfigResponse>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              'binge-mobile-services/pub/api/v1/tsmore/config',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = BaseResponse<ConfigResponse>.fromJson(_result.data!);
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
