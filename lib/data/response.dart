class ApiResponse {
  final String result;

  ApiResponse({
    required this.result,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      result: json['result'],
    );
  }
}
