import 'package:aplikasi_film/services/api_services.dart';
import 'package:flutter/material.dart';
import 'package:aplikasi_film/models/movie.dart';

class HomeScreen extends StatefulWidget{ 
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
final ApiService _apiService = ApiService();

List<Movie> _allMovies = [];
List<Movie> _trendingMovies = [];
List<Movie> _popularMovies = []; //untuk menampung data

Future<void> _loadMovies() async{
  final List<Map<String, dynamic>> allMoviesData = await _apiService.getAllMovies();
 final List<Map<String, dynamic>> TrendingMovies = await _apiService.getTrendingMovies();
 final List<Map<String, dynamic>> popularMoviesData = await _apiService.getPopularMovies();


  setState(() {
    _allMovies = allMoviesData.map((e) => Movie.fromJson(e)).toList();
     _trendingMovies = TrendingMovies.map((e) => Movie.fromJson(e)).toList();
      _popularMovies = popularMoviesData.map((e) => Movie.fromJson(e)).toList();
  });

}

@override 
void initState(){
  super.initState();
  _loadMovies();
}


@override 
Widget build(BuildContext context) {
  return Scaffold( 
    appBar: AppBar(
      title: Text("Filem"),
    ),
    body: SingleChildScrollView( 
      child: Column( 
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          _buildMovieList("All Movies", _allMovies),
          _buildMovieList("Trending Movies", _trendingMovies),
          _buildMovieList("Popular Movies", _popularMovies),
        ],
      ),
    ),
  );
}

Widget _buildMovieList(String title, List<Movie> movies) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),


      ),
      SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: movies.length,
          itemBuilder: (BuildContext context, int index){
            final Movie movie = movies[index];
            return Padding( 
              padding: EdgeInsets.all(8.0),
              child: Column( 
                children: [
                  Image.network(src),
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                ],
              ),
            SizedBox(height: 5),
            Text( 
              movie.title
            )
            ),
          },

        ),
      )
    ],
  );
}