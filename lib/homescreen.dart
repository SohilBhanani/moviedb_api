import 'package:flutter/material.dart';
import 'package:sohilbhanani_moviedb/colors.dart';
import 'package:sohilbhanani_moviedb/movie_details.dart';
import 'package:sohilbhanani_moviedb/services/moviedb_service.dart';
import 'package:sohilbhanani_moviedb/ui_helpers.dart';

import 'models/movie_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Movies",
            style: TextStyle(color: kPrim, fontFamily: "Ubuntu", fontSize: 24),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              padding: EdgeInsets.all(8),
              child: Text("Top Picks",style: TextStyle(fontSize: 22,fontFamily: "Ubuntu"),),
            ),
            Expanded(
              child: FutureBuilder(
                future: fetchMovies(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if(snapshot.hasData){
                  MoviesResponse movies = snapshot.data;
                  // print(movies.result[0]);
                  return GridView.builder(

                    gridDelegate:
                        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3,childAspectRatio: screenWidth(context)/(screenHeight(context)/1.5)),

                    itemBuilder: (BuildContext context, i) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(

                              onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>MovieDetailScreen(movie:movies.result[i]))),
                              // onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TestDetail(movies.result[i]))),
                              child: Card(
                                shape: roundedCornerShape(5),
                                elevation: 2,
                                child: Container(
                                  child: ClipRRect(
                                      borderRadius: roundedCorner(5),

                                      child:
                                          Image.network("https://image.tmdb.org/t/p/w500/"+movies.result[i].posterPath,fit: BoxFit.cover,),
                                       ),
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.favorite,size: 18,),
                              Text(movies.result[i].voteCount.toString())
                            ],
                          )
                        ],
                      );
                    },
                    itemCount: movies.result.length,
                  );
                  }else{
                    return Center(child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(kred),));
                  }
                },
              ),
            ),
          ],
        ));
  }
}
