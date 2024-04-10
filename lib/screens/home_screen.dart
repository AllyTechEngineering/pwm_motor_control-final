import 'package:flutter/material.dart';
import 'package:pwm_motor_control/src/pwm_motor_control.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PwmMotorControl pwmMotorControl = PwmMotorControl();
  String temperatureValue = '';
  @override
  void initState() {
    pwmMotorControl.initializePwm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PWM Motor Control'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('PWM'),
            const SizedBox(
              height: 20.0,
            ),
            getMotorPwm0Percent(),
            const SizedBox(
              height: 20.0,
            ),
            getMotorPwm25Percent(),
            const SizedBox(
              height: 20.0,
            ),
            getMotorPwm50Percent(),
            const SizedBox(
              height: 20.0,
            ),
            getMotorPwm75Percent(),
            const SizedBox(
              height: 20.0,
            ),
            getMotorPwm100Percent(),
          ],
        ),
      ),
    );
  }

  Widget getMotorPwm0Percent() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pwmMotorControl.setPwmMotorDutyCycle(0);
        });
      },
      child: const Text('Motor PWM 0%'),
    );
  }

  Widget getMotorPwm25Percent() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pwmMotorControl.setPwmMotorDutyCycle(2500000);
        });
      },
      child: const Text('Motor PWM 25%'),
    );
  }

  Widget getMotorPwm50Percent() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pwmMotorControl.setPwmMotorDutyCycle(5000000);
        });
      },
      child: const Text('Motor PWM 50%'),
    );
  }

  Widget getMotorPwm75Percent() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pwmMotorControl.setPwmMotorDutyCycle(7500000);
        });
      },
      child: const Text('Motor PWM 75%'),
    );
  }

  Widget getMotorPwm100Percent() {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          pwmMotorControl.setPwmMotorDutyCycle(10000000);
        });
      },
      child: const Text('Motor PWM 100%'),
    );
  }
}
