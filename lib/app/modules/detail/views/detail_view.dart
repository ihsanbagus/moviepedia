import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:moviepedia/app/modules/detail/views/widgets/detail_stack.dart';
import 'package:moviepedia/app/modules/detail/views/widgets/placeholder.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (movie) => Scaffold(
        appBar: AppBar(
          title: Text(
            "${movie?.originalTitle}",
            overflow: TextOverflow.ellipsis,
          ),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${movie?.backdropPath}",
              ),
              fit: BoxFit.cover,
              opacity: 0.3,
            ),
          ),
          child: ListView(scrollDirection: Axis.vertical, children: [
            Container(
                height: 600,
                color: Colors.blue,
                child: DetailsStack(
                  isAdult: movie!.adult!,
                  name: movie.originalTitle!,
                  description: movie.overview!,
                  posterUrl:
                      "https://image.tmdb.org/t/p/w500${movie.posterPath}",
                  rating: movie.voteAverage!,
                )),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Overview',
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  color: Theme.of(context).colorScheme.onBackground,
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              child: Text(
                "${movie.overview}",
                maxLines: 10,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.rubik(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ]),
        ),
      ),
      onLoading: const ContentPlaceHolder(),
      onError: (error) => Text("$error"),
    );
  }
}
