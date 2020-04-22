abstract class BaseResponse {
  final bool status;
  final String message;
  final String error;
  BaseResponse(
    this.status,
    this.error,
    this.message,
  );
}
