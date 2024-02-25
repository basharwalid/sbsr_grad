import 'package:image_picker/image_picker.dart';

abstract class FirebaseImageDatabaseRemoteDataSource{
  Future<String> uploadImage({required XFile file});
}