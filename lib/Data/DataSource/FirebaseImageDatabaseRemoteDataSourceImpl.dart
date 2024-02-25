import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sbsr_grad/Data/Firebase/FirebaseImagesDatabase.dart';
import 'package:sbsr_grad/Domain/DataSource/firebaseImageDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Exceptions/FirebaseImageException.dart';

FirebaseImageDatabaseRemoteDataSource injectFirebaseImageDatabaseRemoteDataSourceImpl(){
  return FirebaseImageDatabaseRemoteDataSourceImpl(imagesDatabase: injectFirebaseImagesDatabase());
}

class FirebaseImageDatabaseRemoteDataSourceImpl implements FirebaseImageDatabaseRemoteDataSource{
  FirebaseImagesDatabase imagesDatabase;
  FirebaseImageDatabaseRemoteDataSourceImpl({required this.imagesDatabase});

  @override
  Future<String> uploadImage({required XFile file}) async{
      try {
        var response = await imagesDatabase.uploadImage(image: file).timeout(const Duration(seconds: 60));
        return response;
      }on FirebaseException catch(e){
        throw FirebaseImageException(errorMessage: e.code);
      }
  }
}