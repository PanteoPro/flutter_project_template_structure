import 'package:bloc/bloc.dart';
import 'package:corporative_messager/core/cubit/base_cubit.dart';
import 'package:corporative_messager/features/test/data/repositories/test_repositry.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'test_state.dart';
part 'test_cubit.freezed.dart';

class TestCubit extends BaseCubit<TestState> {
  TestCubit({
    required TestRepository testRepository,
  })  : _testRepository = testRepository,
        super(const TestState.initial(id: 1));

  final TestRepository _testRepository;

  Future<void> test() async {
    await baseRequest(
      _testRepository.test('sdas'),
      loadingState: const TestState.loading(id: 1, progress: 2),
      loadedState: (response) =>
          TestState.loaded(id: state.id, guid: response.resultGuid),
      errorState: (exception) => TestState.error(id: state.id),
    );
  }
}
