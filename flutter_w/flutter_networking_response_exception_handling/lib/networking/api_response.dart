class ApiResponse<T> {
  final Status status;
  final T? data;
  final String? message;

  ApiResponse.loading([this.message]) : status = Status.LOADING, data = null;
  ApiResponse.completed(this.data) : status = Status.COMPLETED, message = null;
  ApiResponse.error([this.message]) : status = Status.ERROR, data = null;

  @override
  String toString() {
    return "Status : $status \nMessage : $message \nData : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }