import 'package:image_picker/image_picker.dart';

abstract class FirebaseImageDatabaseRemoteDataSource{
  Future<String> uploadImage({required XFile file});
  Future<String> updateUserImage({required XFile file, required String url});
}