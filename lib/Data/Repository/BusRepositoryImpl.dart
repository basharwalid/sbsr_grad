import 'package:sbsr_grad/Data/DataSource/FirebaseBusDatabaseRemoteDataSourceImpl.dart';
import 'package:sbsr_grad/Domain/DataSource/FirebaseBusDatabaseRemoteDataSource.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';
import 'package:sbsr_grad/Domain/Repository/BusRepository.dart';


BusRepository injectBusRepository(){
  return BusRepositoryImpl(remoteDataSource: injectFirebaseBusDatabaseRemoteDataSourceImpl());
}
class BusRepositoryImpl implements BusRepository{
  FirebaseBusDatabaseRemoteDataSource remoteDataSource;
  BusRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Bus>> getAllBus()async{
    var response = await remoteDataSource.getAllBus();
    return response;
  }

}