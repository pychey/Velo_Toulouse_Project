enum AsyncState { loading, error, success }

class AsyncValue<T> {
  final AsyncState state;
  final T? data;
  final Object? error;

  AsyncValue._({required this.state, this.data, this.error});

  factory AsyncValue.loading() => AsyncValue._(state: AsyncState.loading);

  factory AsyncValue.error(Object error) =>
      AsyncValue._(state: AsyncState.error, error: error);

  factory AsyncValue.success(T data) =>
      AsyncValue._(state: AsyncState.success, data: data);
}