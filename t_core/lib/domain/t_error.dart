class TError implements Exception {
  final String reason;
  final String message;

  const TError(this.reason, this.message);
}