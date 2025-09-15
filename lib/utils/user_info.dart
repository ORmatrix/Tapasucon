import 'package:flutter/material.dart';


class ExercisesTitle extends StatelessWidget {
  final icon;
  final String exerciseName;
  final String numberOfExercises;
  final color;
  // final Widget page;
  const ExercisesTitle({
    Key? key,
    required this.icon,
    required this.exerciseName,
    required this.numberOfExercises,
    required this.color,
    // required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),


      child: Container(



        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(25),
            bottom: Radius.circular(25),
          ),
          boxShadow: [
            // to make elevation
            BoxShadow(
              color: Colors.white,
              offset: Offset(2, 2),
              blurRadius: 6,
            ),
            // to make the coloured border

          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(


              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(

                      padding: EdgeInsets.all(1),
                      color: color,
                      child: Image.asset(icon,
                          width: 100,
                          height: 100,
                          fit:BoxFit.fill)
                  ),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exerciseName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontSize: 16,

                      ),
                    ),
                    SizedBox(height: 5,),
                    Text(numberOfExercises,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontSize: 16,

                      ),
                    ),

                  ],

                ),

              ],

            ),


          ],


        ),
      ),

    );

  }
}
