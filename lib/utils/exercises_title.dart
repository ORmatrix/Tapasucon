import 'package:flutter/material.dart';


class ExercisesTitle extends StatelessWidget {
  final icon;
  final String exerciseName;
  // final String numberOfExercises;
  final color;
  final Widget page;
  const ExercisesTitle({
    Key? key,
    required this.icon,
    required this.exerciseName,
    // required this.numberOfExercises,
    required this.color,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        },

        child: Container(



          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(16),
            ),
            boxShadow: [
              // to make elevation
              BoxShadow(
                color: color,
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
                    borderRadius: BorderRadius.circular(12),
                    child: Container(

                      padding: EdgeInsets.all(10),
                      color: color,
                      child: Icon(icon,
                        color: Colors.white,),),
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
                      // SizedBox(height: 5,),
                      // Text(numberOfExercises,
                      //   style: TextStyle(
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.grey,
                      //     fontSize: 16,
                      //
                      //   ),
                      // ),

                    ],

                  ),

                ],

              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white,
                ),
                height: 50,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: 12.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0)),
                        color: color,
                      ),
                    ),

                  ],
                ),
              ),



            ],


          ),
        ),
      ),
    );

  }
}
