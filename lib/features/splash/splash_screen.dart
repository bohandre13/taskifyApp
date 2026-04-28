import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskify/core/theme/app_theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeOut),
    );

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeOutBack),
      ),
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1.0, curve: Curves.easeInOut),
      ),
    );

    _controller.forward();

    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        // context.go('/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: Icon(
                            Icons.check_rounded,
                            size: size.width * 0.2,
                            color: Colors.white,
                          ),
                        ),
                        Gap(size.height * 0.05),
                        Text(
                          'Taskify',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width * 0.1,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Rajdhani',
                            letterSpacing: 1.5,
                          ),
                        ),
                        Gap(size.height * 0.05),
                        Text(
                          'Organiza tu vida y tus finanzas',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.65),
                            fontSize: size.width * 0.05,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Rajdhani',
                            letterSpacing: 1.5,
                          ),
                        ),
                        Gap(size.height * 0.1),
                        Padding(
                          padding: EdgeInsets.only(
                            left: size.width * 0.2,
                            right: size.width * 0.2,
                            bottom: size.height * 0.05,
                          ),
                          child: Column(
                            children: [
                              AnimatedBuilder(
                                animation: _progressAnimation,
                                builder: (context, _) {
                                  return Column(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(4),
                                        child: LinearProgressIndicator(
                                          value: _progressAnimation.value,
                                          backgroundColor: Colors.white
                                              .withValues(alpha: 0.2),
                                          valueColor:
                                              const AlwaysStoppedAnimation<
                                                Color
                                              >(Colors.white),
                                          minHeight: 4,
                                        ),
                                      ),
                                      Gap(size.height * 0.01),
                                      Text(
                                        _getLoadingText(
                                          _progressAnimation.value,
                                        ),
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: 0.5,
                                          ),
                                          fontSize: size.width * 0.05,
                                          fontFamily: 'Rajdhani',
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLoadingText(double progress) {
    if (progress < 0.4) return 'Cargando...';
    if (progress < 0.7) return 'Preparando tu espacio...';
    return 'Listo!';
  }
}
