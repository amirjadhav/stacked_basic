import 'package:injectable/injectable.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_basic/app/locator.dart';
import 'package:stacked_basic/app/router.gr.dart';
import 'package:stacked_services/stacked_services.dart';

@lazySingleton
class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigatetoLogin() async {
    await _navigationService.navigateTo(Routes.loginView);
  }
}
