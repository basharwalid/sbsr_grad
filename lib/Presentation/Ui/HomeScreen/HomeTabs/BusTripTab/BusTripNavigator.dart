import 'package:sbsr_grad/Core/Base/BaseNavigator.dart';
import 'package:sbsr_grad/Domain/Models/Bus.dart';

abstract class BusTripNavigator extends BaseNavigator{
  goToDetailsScreen({required Bus bus});
}