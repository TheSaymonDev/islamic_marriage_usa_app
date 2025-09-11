import 'dart:async';
import 'package:get/get.dart';

class ForgotTimerController extends GetxController {
  Duration _duration = const Duration(minutes: 2, seconds: 30);
  bool _showResendButton = false;
  Timer? _timer;

  Duration get duration => _duration;
  bool get showResendButton => _showResendButton;
  Timer? get timer => _timer;

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  void startTimer() {
    // আগের timer cancel করুন (যদি running থাকে)
    _timer?.cancel();

    // Duration reset করুন
    _duration = const Duration(minutes: 2, seconds: 30);
    _showResendButton = false;

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_duration.inSeconds > 0) {
        _duration = _duration - const Duration(seconds: 1);
      } else {
        timer.cancel();
        _showResendButton = true;
      }
      update(); // UI update করার জন্য
    });
  }

  String getFormattedDuration() {
    final minutes = _duration.inMinutes.remainder(60);
    final seconds = _duration.inSeconds.remainder(60);
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}