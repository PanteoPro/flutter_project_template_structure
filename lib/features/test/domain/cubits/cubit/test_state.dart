part of 'test_cubit.dart';

@freezed
class TestState with _$TestState {
  const factory TestState.initial({
    required int id,
  }) = _Initial;

  const factory TestState.loading({
    required int id,
    required int progress,
  }) = _Loading;

  const factory TestState.loaded({
    required int id,
    required String guid,
  }) = _Loaded;

  const factory TestState.error({
    required int id,
  }) = _Error;
}
