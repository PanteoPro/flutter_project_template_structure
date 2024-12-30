import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BaseCubit<State> extends Cubit<State>
    with BlocBaseRequest<State> {
  BaseCubit(State initialState) : super(initialState);

  @override
  void emit(State state) {
    if (!isClosed) {
      super.emit(state);
    }
  }

  @override
  Future<void> baseRequest<Model>(
    Future<Model> request, {
    void Function(State state)? emit,
    Function(DioException exception)? onError,
    Function(Model response)? onSuccess,
    State? loadingState,
    State Function(Model response)? loadedState,
    State Function(DioException exception)? errorState,
  }) {
    return super.baseRequest<Model>(
      request,
      emit: this.emit,
      onError: onError,
      onSuccess: onSuccess,
      loadingState: loadingState,
      loadedState: loadedState,
      errorState: errorState,
    );
  }
}

mixin BlocBaseRequest<State> {
  Future<void> baseRequest<Model>(
    Future<Model> request, {
    void Function(State state)? emit,
    Function(DioException exception)? onError,
    Function(Model response)? onSuccess,
    State? loadingState,
    State Function(Model response)? loadedState,
    State Function(DioException exception)? errorState,
  }) async {
    if (emit == null) return;
    Function(DioException exception) callbackWhenError;
    Function(Model response) callbackWhenSuccess;
    if (onSuccess != null) {
      assert(onError != null,
          'Если есть callback onSuccess, то тогда нужно передавать и onError');

      callbackWhenError = (exception) => onError!.call(exception);
      callbackWhenSuccess = (response) => onSuccess.call(response);
    } else {
      assert(loadedState != null,
          'Если не передавать callBack\'и, то нужно передать все state\'ы');
      assert(errorState != null,
          'Если не передавать callBack\'и, то нужно передать все state\'ы');
      assert(loadingState != null,
          'Если не передавать callBack\'и, то нужно передать все state\'ы');

      if (loadingState != null) {
        emit(loadingState);
      }
      callbackWhenError = (exception) => emit(errorState!.call(exception));
      callbackWhenSuccess = (response) => emit(loadedState!.call(response));
    }
    try {
      final response = await request;
      callbackWhenSuccess(response);
    } on DioException catch (e) {
      callbackWhenError(e);
    }
  }
}
