import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviepedia/app/modules/home/models/movie_model.dart';
import 'package:moviepedia/app/modules/home/views/widgets/placeholder.dart';
import 'package:moviepedia/app/routes/app_pages.dart';

class MovieList extends StatelessWidget {
  const MovieList({super.key, required this.movies, required this.title});

  final List<Results>? movies;
  final String title;

  @override
  Widget build(BuildContext context) {
    return movies == null
        ? const ContentPlaceHolder()
        : Container(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      color: Theme.of(context).colorScheme.onSecondaryContainer,
                      fontSize: 25),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  height: 360,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: movies?.length,
                    itemBuilder: (context, index) => Material(
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {
                          Get.toNamed(
                            Routes.DETAIL,
                            parameters: {"id": movies![index].id.toString()},
                          );
                        },
                        child: SizedBox(
                          width: 200,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 7),
                                      height: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.3),
                                            blurRadius: 5,
                                            spreadRadius: 3,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${movies![index].posterPath}',
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 25,
                                      top: 10,
                                      child: Container(
                                        width: 55,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              225, 0, 0, 0),
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 10,
                                              spreadRadius: 6,
                                              color:
                                                  Colors.black.withOpacity(0.3),
                                            ),
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(60),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 32,
                                      top: 15,
                                      child: Text(
                                        '${movies![index].voteAverage?.toStringAsFixed(1)} ⭐',
                                        style: GoogleFonts.poppins(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondaryContainer,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(6, 10, 10, 0),
                                  child: Text(
                                    movies![index].originalTitle ?? 'No Title',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onTertiaryContainer,
                                      fontWeight: FontWeight.w500,
                                    ),
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
              ],
            ),
          );
  }
}
