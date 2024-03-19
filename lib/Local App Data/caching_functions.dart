import 'package:eductionsystem/Local%20App%20Data/Local/local_storage.dart';

class LoginCaching {
  Future<void> loginStatusTrue() async {
    HiveBoxManager.addToBox("LoginData", "LogStatus", true);
  }

  Future<void> loginStatusFalse() async {
    HiveBoxManager.addToBox("LoginData", "LogStatus", false);
  }
}
class OnBoarding{
  Future<void> onBoardingStatus() async {
    HiveBoxManager.addToBox("LoginData", "OnboardingStatus", true);
  }
}