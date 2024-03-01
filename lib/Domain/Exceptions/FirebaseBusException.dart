class FirebaseBusException implements Exception{
  String? errorMessage;
  FirebaseBusException({required this.errorMessage});
}