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
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.9),
                color.withOpacity(0.6),
                Colors.white,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.3),
                blurRadius: 12,
                offset: const Offset(4, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // Icon container
              Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      color,
                      color.withOpacity(0.7),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),

              // Title and subtitle
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exerciseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                    ),
                    //const SizedBox(height: 4),
                    // Text(
                    //   "Tap to explore exercises",
                    //   style: TextStyle(
                    //     fontSize: 13,
                    //     color: Colors.grey[700],
                    //   ),
                    // ),
                  ],
                ),
              ),

              // Arrow indicator
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: color.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
