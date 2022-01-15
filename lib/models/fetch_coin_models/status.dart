class Status {
  Status({
    required this.timestamp,
    required this.errorCode,
    required this.errorMessage,
    required this.elapsed,
    required this.creditCount,
    required this.notice,
    required this.totalCount,
  });

  DateTime timestamp;
  int errorCode;
  String errorMessage;
  int elapsed;
  int creditCount;
  String notice;
  int totalCount;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        timestamp: DateTime.parse(json["timestamp"]),
        errorCode: json["error_code"],
        errorMessage:
            json["error_message"] == null ? "" : json["error_message"],
        elapsed: json["elapsed"],
        creditCount: json["credit_count"] == null ? 0 : json["credit_count"],
        notice: json["notice"] == null ? "" : json["notice"],
        totalCount: json["total_count"],
      );

  Map<String, dynamic> toJson() => {
        "timestamp": timestamp.toIso8601String(),
        "error_code": errorCode,
        "error_message": errorMessage,
        "elapsed": elapsed,
        "credit_count": creditCount,
        "notice": notice,
        "total_count": totalCount,
      };
}
