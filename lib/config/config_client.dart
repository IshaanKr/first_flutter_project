import 'package:dio/dio.dart';
import 'package:first_flutter_project/network/endpoints.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../home_screen/rest_client.dart';

part 'config_client.g.dart';

@RestApi(baseUrl: baseUrlUat)
abstract class ConfigClient {
  factory ConfigClient(Dio dio, {String baseUrl}) = _ConfigClient;

  @GET(configEndpoint)
  Future<BaseResponse<ConfigResponse>> getConfigResponse();
}

@JsonSerializable()
class ConfigResponse {
  late Config config;

  ConfigResponse(
    this.config,
  );

  factory ConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigResponseToJson(this);
}

@JsonSerializable()
class Config {
  @JsonKey(name: "availableProviders")
  late List<AvailableProvider> genericPartners;
  @JsonKey(name: "providerLogo")
  late Map<String, ProviderLogo> providerLogos;

  Config(this.genericPartners, this.providerLogos);

  factory Config.fromJson(Map<String, dynamic> json) => _$ConfigFromJson(json);
  Map<String, dynamic> toJson() => _$ConfigToJson(this);
}

@JsonSerializable()
class ProviderLogo {
  @JsonKey(name:"providerPiPageLogo") late String piLogo;
  @JsonKey(name:"providerRailPageLogo") late String railLogo;

  ProviderLogo(this.piLogo, this.railLogo);

  factory ProviderLogo.fromJson(Map<String, dynamic> json) => _$ProviderLogoFromJson(json);
  Map<String, dynamic> toJson() => _$ProviderLogoToJson(this);
}

@JsonSerializable()
class AvailableProvider {
  @JsonKey(name: 'providerPiPageLogo')
  late String piLogo;
  @JsonKey(name: 'railPageLogo')
  late String railLogo;
  @JsonKey(name: 'providerName')
  late String name;

  AvailableProvider(this.piLogo, this.railLogo, this.name);

  factory AvailableProvider.fromJson(Map<String, dynamic> json) =>
      _$AvailableProviderFromJson(json);
  Map<String, dynamic> toJson() => _$AvailableProviderToJson(this);
}
