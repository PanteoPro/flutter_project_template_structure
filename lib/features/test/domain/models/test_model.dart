import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_model.freezed.dart';

@freezed
class TestModel with _$TestModel {
  factory TestModel({
    required String guid,
  }) = _TestModel;
}
