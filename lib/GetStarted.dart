import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymv2/MovieList.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 0.91),
      body: Column(
        children: [

          Spacer(),
          SvgPicture.asset("assets/undraw_cinema.svg"),

          SizedBox(
            height: 20,
          ),


          Center(child :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),

              Text("Watch ",
                style:
                TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),),



              Text("Movie",
                style:
                TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(159, 138, 192, 1),
                  fontWeight: FontWeight.w600,
                ),),

              Spacer(),
            ],
          )),

          Text("Anytime Anywhere",
            style:
            TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.w600
            ),),

          Text("With",
            style:
            TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.w200
            ),),

          Center(child :
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Spacer(),

              Text("my",
                style:
                TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w600
                ),),



              Text("Mv",
                style:
                TextStyle(
                  fontSize: 64,
                  color: Color.fromRGBO(159, 138, 192, 1),
                  fontWeight: FontWeight.w600,
                ),),

              Spacer(),
            ],
          )),

          Container(
            width: double.infinity,
            height: size.height * 0.2 ,
            child: Stack(
              children: [
                Positioned(
                    left: 0,
                    bottom: 0,
                    child: SvgPicture.asset("assets/Cloud.svg")),

                Positioned(
                  right: 25,
                  bottom: 70,
                    child: SizedBox(
                      height: 50 ,
                      width: 130,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MovieList()),
                        );},
                        child: Text("Get Started",
                          style: TextStyle(
                            color: Color.fromRGBO(31, 31, 31, 0.91),
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                          ),),
                        style: ElevatedButton.styleFrom(

                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            backgroundColor: Color.fromRGBO(159, 138, 192, 1)
                        ),),),
                    )
              ],
            ),
          ),

        ],
      )
    );
  }
}
