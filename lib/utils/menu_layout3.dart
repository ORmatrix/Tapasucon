import 'dart:ui';
import 'package:flutter/material.dart';

class ExercisesTitle extends StatefulWidget {
  final IconData icon;
  final String exerciseName;
  final Color color;
  final Widget page;

  const ExercisesTitle({
    Key? key,
    required this.icon,
    required this.exerciseName,
    required this.color,
    required this.page,
  }) : super(key: key);

  @override
  State<ExercisesTitle> createState() => _ExercisesTitleState();
}

class _ExercisesTitleState extends State<ExercisesTitle> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) {
        setState(() => _isPressed = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.page),
        );
      },
      onTapCancel: () => setState(() => _isPressed = false),
      child: AnimatedScale(
        scale: _isPressed ? 0.96 : 1.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.9),
                      Colors.white.withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(0.4),
                      blurRadius: 18,
                      offset: Offset(0, 6),
                    ),
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                  border: Border.all(
                    color: widget.color.withOpacity(0.6),
                    width: 1.5,
                  ),
                ),
                child: Row(
                  children: [
                    // Neon Gradient Icon
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            widget.color,
                            widget.color.withOpacity(0.6),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: widget.color.withOpacity(0.8),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      padding: EdgeInsets.all(14),
                      child: Icon(
                        widget.icon,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 18),

                    // Title
                    Expanded(
                      child: Text(
                        widget.exerciseName,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                          color: widget.color,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),

                    // Animated Forward Arrow
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            widget.color.withOpacity(0.2),
                            widget.color.withOpacity(0.05),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: widget.color,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
