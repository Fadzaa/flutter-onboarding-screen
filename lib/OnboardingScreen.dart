import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mymv2/GetStarted.dart';
import 'package:mymv2/ListTRMovie.dart';
import 'package:mymv2/MovieList.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(31, 31, 31, 0.91),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.only(right: 10,left: 10),
          child: Column(
            children: [

              // Container(
              //
              // ),

              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                itemCount: demo_data.length ,
                onPageChanged: (index) {
                    setState(() {
                      _pageIndex = index;
                    });
                },

                itemBuilder: (context, index) => OnboardContent(
                  image: demo_data[index].image,
                  text: demo_data[index].text,
                  description: demo_data[index].description,
                ),
              ),
              ),

              Row(
                children: [
                  Spacer(),

                  ...List.generate(demo_data.length, (index) =>
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: DotIndicator(isActive: index == _pageIndex,),
                      ),
                  ),

                  Spacer()
                ],
              ),



              Padding(
                padding: EdgeInsets.only(top: 20, right: 30,bottom: 40),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    width: 120,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);


                        if(_pageIndex == 2 ) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GetStarted()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          backgroundColor: Color.fromRGBO(159, 138, 192, 1)
                      ),



                      child:Text("Next",
                        style: TextStyle(
                          color: Color.fromRGBO(31, 31, 31, 0.91),
                          fontWeight: FontWeight.w600,
                          fontSize: 21,
                        ) ,)
                    ),
                  ),
                ),
              ),

            ],
          )
      )
    ));
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,  this.isActive = false,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: 7,
          width: isActive ? 14 : 7,
          decoration: BoxDecoration(
            color: isActive ? Color.fromRGBO(159, 138, 192, 1) : Color.fromRGBO(225, 225, 225 ,0.9),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
    );
  }
}

class Onboard {
  final String image,text,description;

  Onboard({
    required this.image,
    required this.text,
    required this.description,

  });

}

final List <Onboard> demo_data = [
  Onboard(
      image: "assets/undraw_movie.svg",
      text: "Watch Anywhere",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit "
  ),
  Onboard(
      image: "assets/undraw_search.svg",
      text: "Search Movie",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit "
  ),
  Onboard(
      image: "assets/undraw_awards.svg",
      text: "Oscar Awards",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit "
  )
];


class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key, required this.image, required this.text, required this.description,
  }) : super(key: key);

  final String image, text, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        SvgPicture.asset(image,height: 250,),
        Spacer(),

        Text(text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w600
          ),
        ),

        SizedBox(
          height: 20,
        ),

        Text(description,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Color.fromRGBO(205, 205, 205, 0.75),
              fontSize: 16,
              fontWeight: FontWeight.w200
          ),
        ),



        Spacer(),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Align(
        //       alignment: Alignment.bottomLeft,
        //       child: SvgPicture.asset("assets/myMv.svg") ,
        //     ),
        //
        //     Padding(
        //       padding: EdgeInsets.only(top: 20, right: 30),
        //       child: Align(
        //         alignment: Alignment.bottomRight,
        //         child: SizedBox(
        //           width: 120,
        //           height: 50,
        //           child: ElevatedButton(
        //             onPressed: () {},
        //             style: ElevatedButton.styleFrom(
        //
        //                 shape: RoundedRectangleBorder(
        //                     borderRadius: BorderRadius.circular(5)
        //                 ),
        //                 backgroundColor: Color.fromRGBO(159, 138, 192, 1)
        //             ),
        //             child: Text("Next",
        //               style: TextStyle(
        //                 color: Color.fromRGBO(31, 31, 31, 0.91),
        //                 fontWeight: FontWeight.w600,
        //                 fontSize: 21,
        //               ) ,),
        //           ),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),


      ],
    );
  }
}
