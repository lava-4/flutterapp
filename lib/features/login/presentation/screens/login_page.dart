import '../../../login/presentation/providers/login_provider.dart';
import '/core/utils/app_exports.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginNotifier = ref.read(loginProvider.notifier);
    final isOtpSent = ref.watch(loginProvider);

    return AppData.backgroundWrapper(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.heightTwenty),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppConstants.loginTitle,
              textAlign: TextAlign.center,
              style: AppTheme.loginTitle,
            ),
            const SizedBox(height: AppConstants.heightfourty),

            TextFormField(
              controller: loginNotifier.phoneController,
              keyboardType: TextInputType.phone,
              style: AppTheme.textFieldStyle,
              decoration: AppTheme.inputDecoration.copyWith(
                labelText: AppConstants.mobilenumberLabel,
              ),
            ),

            if (isOtpSent) ...[
              const SizedBox(height: AppConstants.heightTen),

              TextFormField(
                controller: loginNotifier.otpController,
                keyboardType: TextInputType.number,
                obscureText: true,
                style: AppTheme.textFieldStyle,
                decoration: AppTheme.inputDecoration.copyWith(
                  labelText: AppConstants.otpLabel,
                ),
              ),
            ],

            const SizedBox(height: AppConstants.heightTwenty),

            ElevatedButton(
              onPressed: () {
                if (isOtpSent) {
                  loginNotifier.verifyOtp(context);
                } else {
                  loginNotifier.sendOtp(context);
                }
              },
              style: AppTheme.buttonStyle,
              child: Text(isOtpSent ? AppConstants.verifyOtpButton : AppConstants.sendOtpButton),
            ),
          ],
        ),
      ),
    );
  }
}
