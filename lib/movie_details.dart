import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sohilbhanani_moviedb/colors.dart';
import 'package:sohilbhanani_moviedb/landscape_player.dart';
import 'package:sohilbhanani_moviedb/models/movie_model.dart';
import 'package:sohilbhanani_moviedb/services/moviedb_service.dart';
import 'package:sohilbhanani_moviedb/testyt.dart';
import 'package:sohilbhanani_moviedb/ui_helpers.dart';

import 'models/new_model.dart';
import 'models/video_model.dart';

class MovieDetailScreen extends StatefulWidget {
  Movies movie;

  MovieDetailScreen({this.movie});

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  sliverAppBar(String backd) => SliverAppBar(
        backgroundColor: Colors.white,
        // pinned: true,
        // snap: true,
        // floating: true,
        expandedHeight: 250,
        flexibleSpace: FlexibleSpaceBar(
            // title:
            //     Text("Popularity: " + widget.movie.popularity.toString()),
            //
            background: FadeInImage(
          fit: BoxFit.cover,
          placeholder: AssetImage("assets/ripple.gif"),
          image: NetworkImage(
            "https://image.tmdb.org/t/p/w780/" + backd,
          ),
        )),
      );

  // movieDetails(MovieDetails movieD, Movies m) => ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      sliverAppBar(widget.movie.backdropPath),
      // newSliver
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
          child: FutureBuilder(
              future: fetchMovieDetails(widget.movie.id),
              builder: (context, AsyncSnapshot<dynamic> snapshot) {
                MovieDetails m = snapshot.data;
                // Widget newSliver;
                if (snapshot.hasData) {
                  print(snapshot);
                  // return movieDetails(snapshot.data, widget.movie);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      verticalSpaceMedium,
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          horizontalSpaceMedium,
                          Container(
                            color: Colors.black,
                            height: 180,
                            width: 120,
                            child: Image.network(
                                "https://image.tmdb.org/t/p/w780/" +
                                    widget.movie.posterPath),
                          ),
                          horizontalSpaceMedium,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Released: " +
                                    DateFormat.yMMMd().format(m.releaseDate),
                                style: TextStyle(
                                    fontFamily: "Ubuntu",
                                    fontWeight: FontWeight.bold),
                              ),
                              verticalSpaceMedium,
                              Text("Popularity: " + m.popularity.toString(),
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.bold)),
                              verticalSpaceMedium,
                              Text(
                                  "Runtime: " +
                                      m.runtime.toString() +
                                      " minutes",
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.bold)),
                              verticalSpaceMedium,
                              Text("Vote Average: " + m.voteAverage.toString(),
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.bold)),
                              verticalSpaceMedium,
                              Text("Vote Count: " + m.voteCount.toString(),
                                  style: TextStyle(
                                      fontFamily: "Ubuntu",
                                      fontWeight: FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                      verticalSpaceSmall,
                      Divider(),
                      verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          m.title,
                          style: TextStyle(fontFamily: "Ubuntu", fontSize: 24),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 28.0,
                        ),
                        child: Text(
                          m.tagline,
                          style: TextStyle(
                              fontFamily: "Ubuntu",
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                              color: Colors.black26),
                        ),
                      ),
                      verticalSpaceSmall,
                      Padding(
                        padding: EdgeInsets.only(left: 28, right: 28),
                        child: Text(
                          m.overview,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      verticalSpaceSmall,
                      Padding(
                        padding: const EdgeInsets.only(left: 28.0),
                        child: Text(
                          "Production",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 110,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 18.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: m.productionCompanies[i].logoPath == null
                                    ? Text(
                                        m.productionCompanies[i].name,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: 'Ubuntu',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      )
                                    : Image.network(
                                        "https://image.tmdb.org/t/p/w500/" +
                                            m.productionCompanies[i].logoPath),
                                maxRadius: 50,
                              ),
                            );
                          },
                          itemCount: m.productionCompanies.length,
                        ),
                      ),

                    ],
                  );
                } else {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      verticalSpaceMedium,
                      Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(kred),
                        ),
                      ),
                    ],
                  );
                }
              }),
        )
      ])

          ),
      SliverList(
          delegate: SliverChildListDelegate([
        Container(
          height: screenHeight(context) - 600,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder(
                future: fetchVideos(widget.movie.id),
                builder: (context, tsnapshot) {
                  Videos v = tsnapshot.data;
                  if(tsnapshot.hasData){

                  return Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                    child: ElevatedButton(
                        onPressed: () {
                         print(v.results[0].key);
                         return Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  YT()
                                  // LandscapePlayerPage(v.results[0].key)
                         ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.movie),
                            horizontalSpaceTiny,
                            Text(
                              "Trailer",
                              // v.results[0].key,
                              style: TextStyle(
                                  fontFamily: 'Ubuntu',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        )),
                  );
                  }else{
                    return Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18.0),
                      child: ElevatedButton(
                          onPressed: null,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.movie),
                              horizontalSpaceTiny,
                              Text(
                                "Unavailable",
                                // v.results[0].key,
                                style: TextStyle(
                                    fontFamily: 'Ubuntu',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    );
                  }
                }
              ),
            ],
          ),
        )
      ]))
    ]));
  }
}
