import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_response.freezed.dart';
part 'test_response.g.dart';

@freezed
class TestResponse with _$TestResponse {
  factory TestResponse({
    required String resultGuid,
  }) = _TestResponse;

  factory TestResponse.fromJson(Map<String, dynamic> json) =>
      _$TestResponseFromJson(json);
}
