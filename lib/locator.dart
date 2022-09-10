import 'package:get_it/get_it.dart';
import 'package:quizjets/export_files.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  //locator.registerLazySingleton(() => Api());
}