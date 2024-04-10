// import 'dart:io';

import 'package:dart_periphery/dart_periphery.dart';
import 'package:flutter/foundation.dart';

class PwmMotorControl {
  //GPIO 18: level=0 alt=5 func=PWM0_0 pull=DOWN
  //18: a5    pd | lo // GPIO18 = PWM0_0
  /*
  0,0 fails
  1,0 fails
  0,1
  1,1
  2,0
  2,1
  0,2 fails
  1,2
  2,2 fails

  */
  // ignore: prefer_typing_uninitialized_variables
  var pwm;

  void initializePwm() {
    pwm = PWM(0, 1); // chip, channel
    debugPrint('PWM Info: ${pwm.getPWMinfo()}');
  }

  void setPwmMotorDutyCycle(int pwmDutyCycle) {
    pwm.setPeriodNs(
        10000000); // Sets the period in [nanoseconds] of the PWM. 10000000nS is 100Hz
    pwm.setDutyCycleNs(
        pwmDutyCycle); // Sets the duty cycle in [nanoseconds] of the PWM.
    debugPrint(pwm.getPeriodNs().toString());
    pwm.enable();
    // debugPrint("Wait 20 seconds");
    // sleep(const Duration(seconds: 20));
    // pwm.disable();
  }

  void disposePwm() {
    pwm.dispose();
  }
}
