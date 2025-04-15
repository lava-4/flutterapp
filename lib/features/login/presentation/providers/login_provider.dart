import 'package:flutter_riverpod/flutter_riverpod.dart';
import '/core/utils/app_exports.dart';

class LoginProvider extends StateNotifier<bool> {
  LoginProvider(this.ref) : super(false);

  final Ref ref;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();


  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }


  void sendOtp(BuildContext context) {
    final phoneNumber = phoneController.text.trim();
    if (phoneNumber.isEmpty || phoneNumber.length < AppConstants.mobNumLength) {
      _showSnackbar(context, AppConstants.invalidPhoneNumber);
      return;
    }

    state = true; // OTP Sent State
    _showSnackbar(context, AppConstants.otpSend);
  }


  Future<void> verifyOtp(BuildContext context) async {
    final otp = otpController.text.trim();
    if (otp.isEmpty || otp.length != AppConstants.otpLength) {
      _showSnackbar(context, AppConstants.enterOtp);
      return;
    }

    if (otp == AppConstants.otp) {
      await SharedPrefHelper.setLoggedIn(true);
      state = false; // Reset OTP state
      _showSnackbar(context, AppConstants.loginSuccess);

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/welcome');
      }
    } else {
      _showSnackbar(context, AppConstants.invalidOtp);
    }
  }
}


final loginProvider = StateNotifierProvider<LoginProvider, bool>((ref) {
  return LoginProvider(ref);
});
