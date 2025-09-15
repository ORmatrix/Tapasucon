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
  bool _pressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => _pressed = true),
      onTapUp: (_) {
        setState(() => _pressed = false);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.page),
        );
      },
      onTapCancel: () => setState(() => _pressed = false),
      child: AnimatedScale(
        scale: _pressed ? 0.95 : 1,
        duration: Duration(milliseconds: 200),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 4),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(22),
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.75),
                  Colors.white.withOpacity(0.35),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(
                color: widget.color.withOpacity(0.7),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.4),
                  blurRadius: 20,
                  offset: Offset(0, 8),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(22),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 18.0, horizontal: 20),
                  child: Row(
                    children: [
                      // Icon with glow
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            colors: [
                              widget.color,
                              widget.color.withOpacity(0.7),
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: widget.color.withOpacity(0.6),
                              blurRadius: 12,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        padding: EdgeInsets.all(14),
                        child: Icon(
                          widget.icon,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      SizedBox(width: 18),

                      // Title
                      Expanded(
                        child: Text(
                          widget.exerciseName,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.6,
                            color: widget.color,
                          ),
                        ),
                      ),

                      // Arrow
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 300),
                        opacity: _pressed ? 0.6 : 1,
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
      ),
    );
  }
}
