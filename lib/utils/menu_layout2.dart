import 'package:flutter/material.dart';

class ExercisesTitle extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.9),
                Colors.white.withOpacity(0.6),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.5),
                offset: Offset(0, 6),
                blurRadius: 12,
              ),
            ],
            border: Border.all(
              color: color.withOpacity(0.6),
              width: 1.2,
            ),
          ),
          child: Row(
            children: [
              // Icon container with glow effect
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [color, color.withOpacity(0.7)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.6),
                      blurRadius: 12,
                      spreadRadius: 1,
                    )
                  ],
                ),
                padding: EdgeInsets.all(14),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              SizedBox(width: 16),

              // Title
              Expanded(
                child: Text(
                  exerciseName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: color,
                    letterSpacing: 0.5,
                  ),
                ),
              ),

              // Animated Arrow Indicator
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 18,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
