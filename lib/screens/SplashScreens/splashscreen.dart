// ignore_for_file: use_build_context_synchronously
import 'package:campus_companion/screens/intro_screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/colors_constants.dart';

class SplashScreen extends StatefulWidget 
{
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controllerN;
  late AnimationController _controllerC;
  late AnimationController _controllerU;
  late AnimationController _controllerLogo;
  late AnimationController _controllerText;

  @override
  void initState() {
    super.initState();

    _controllerN = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controllerC = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controllerU = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _controllerLogo = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _controllerText = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _controllerN.forward();

    _controllerN.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerN.reset();
        _controllerC.forward();
      }
    });

    _controllerC.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerC.reset();
        _controllerU.forward();
      }
    });

    _controllerU.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controllerU.reset();
        _controllerLogo.forward();
        Future.delayed(const Duration(seconds: 1), () {
          _controllerText.forward();
        });
      }
    });

    _controllerText.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Future.delayed(const Duration(seconds: 3), () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedBuilder(
              animation: _controllerN,
              builder: (context, child) {
                return _buildLetter('N', _controllerN);
              },
            ),
            AnimatedBuilder(
              animation: _controllerC,
              builder: (context, child) {
                return _buildLetter('C', _controllerC);
              },
            ),
            AnimatedBuilder(
              animation: _controllerU,
              builder: (context, child) {
                return _buildLetter('U', _controllerU);
              },
            ),
            AnimatedBuilder(
              animation: _controllerLogo,
              builder: (context, child) {
                return _buildImage(_controllerLogo);
              },
            ),
            AnimatedBuilder(
              animation: _controllerText,
              builder: (context, child) {
                return _buildText(_controllerText);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLetter(String letter, AnimationController controller) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: controller,
          curve: const Interval(0.0, 0.5,
              curve: Curves.easeInOut), // Adjusted curve
        ),
      ),
      child: ScaleTransition(
        scale: Tween<double>(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.0, 0.5,
                curve: Curves.easeInOut), // Adjusted curve
          ),
        ),
        child: FadeTransition(
          opacity: Tween<double>(begin: 1.0, end: 0.0).animate(
            CurvedAnimation(
              parent: controller,
              curve: const Interval(0.5, 1.0,
                  curve: Curves.easeInOut), // Adjusted curve
            ),
          ),
          child: Text(
            letter,
            style: const TextStyle(
              color: ColorsConstants.primaryBlue,
              fontSize: 200, // Adjusted font size
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage(AnimationController controller) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = controller.value;
        final offset = Offset(0, -100 + 100 * value);
        return Transform.translate(
          offset: offset,
          child: Opacity(
            opacity: value,
            child: Image.asset(
              'assets/images/ncu_logo.png',
              height: 200,
            ),
          ),
        );
      },
    );
  }

  Widget _buildText(AnimationController controller) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final value = controller.value;
        final offset = Offset(0, 200 - 100 * value); 
        return Transform.translate(
          offset: offset,
          child: Opacity(
            opacity: value,
            child: const Text(
              'NCU Saathi', 
              style: TextStyle(
                color: ColorsConstants.primaryBlue,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controllerN.dispose();
    _controllerC.dispose();
    _controllerU.dispose();
    _controllerLogo.dispose();
    _controllerText.dispose();
    super.dispose();
  }
}
