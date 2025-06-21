

sealed class  Result <T>{}
class SuccessResult<T> extends Result<T>{
  final T data;

  SuccessResult(this.data);
}
class FailureResult<T> extends Result<T>{
  final String failureError;
  FailureResult(this.failureError);
}
class GeneralFailureResult<T> extends Result<T>{
  final String failureError;

  GeneralFailureResult(this.failureError);
}