import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mymv2/ListTRMovie.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  State<MovieList> createState() => _MovieListState();
}



class _MovieListState extends State<MovieList> {
  ListTRMovie? listTopRatedMovie;
  List<Results>? results;
  bool isLoaded = true;
  final controller = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListMv();
  }

  void  getAllListMv() async{
    setState(() {
      isLoaded = false;
    });

    final res = await http.get(
        Uri.parse(
            "https://api.themoviedb.org/3/movie/top_rated?api_key=2d51650e8cf7b5a2d13b814001a0dd30"
        )
    );

    listTopRatedMovie = ListTRMovie.fromJson(json.decode(res.body.toString()));

    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(31, 31, 31, 0.91),
      body: Padding(
            padding: const EdgeInsets.only(left: 20,right: 10,bottom: 0,top: 30),
          child: Container(
            width: double.infinity,
            height: size.height * 1,
            child: Column(
              children: <Widget> [

                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Search a Movie",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600
                      ),),

                    SvgPicture.asset("assets/myMv.svg")
                  ],

                ),

                const SizedBox(
                  height: 20,
                ),

                TextField(
                  controller: controller,
                  style: const TextStyle(
                      color: Colors.white
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(143, 143, 143, 0.5),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(color: Colors.grey)
                      ),
                      hintText: 'Search Here',hintStyle: const TextStyle(color: Color.fromRGBO(227, 227, 227, 1))
                  ),
                  onChanged: null,
                ),

                Container(
                  width: double.infinity,
                  height: size.height * 0.75,
                  child: isLoaded ? ListView.builder(
                      itemCount: listTopRatedMovie!.results!.length,
                      itemBuilder: (BuildContext context, int Index) {
                        return Container(
                          height: 170,
                          width: double.infinity,


                          child: Stack(
                            children: [
                              Positioned(

                                  child: Container(
                                    height: 150,
                                    width: 100,
                                    // color: Colors.red,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),

                                    ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network("https://image.tmdb.org/t/p/w500/" + listTopRatedMovie!.results![Index].posterPath.toString()),
                                      ),

                                  )

                              ),

                              Positioned(
                                  left:100,
                                  right: 10,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                      child: Text(listTopRatedMovie!.results![Index].title.toString(),
                                        style: TextStyle(
                                            color: Color.fromRGBO(205, 205, 205, 1),
                                            fontSize: 16,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400
                                        )
                                        ,)
                                  )
                              ),

                              Positioned(
                                  left:100,
                                  right: 10,
                                  top: 25,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Text(listTopRatedMovie!.results![Index].releaseDate.toString(),
                                        style: TextStyle(
                                            color: Color.fromRGBO(205, 205, 205, 1),
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w200
                                        )
                                        ,)
                                  )
                              ),
                            ],
                          ),

                        );
                      }


                  ) : Center(child: CircularProgressIndicator(),)

                ),
              ],
            ),
          )

        )

    );

}


}
