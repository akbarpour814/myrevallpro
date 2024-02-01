abstract class TUseCase<T> {
  Future<T> call();
}

abstract class TPUseCase<T, P> {
  Future<T> call(P param);
}
