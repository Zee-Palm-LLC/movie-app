class Movie {
  String thumbnail;
  String name;
  String movieType;
  MoviePlatform moviePlatform;

  Movie(
      {required this.thumbnail,
      required this.name,
      required this.movieType,
      required this.moviePlatform});
}

List<Movie> moviesList = [
  Movie(
      thumbnail: 'assets/wednesday.png',
      name: 'Wednesday',
      movieType: "Fantasy ⦿ For Teenages",
      moviePlatform: MoviePlatform.netflix),
  Movie(
      thumbnail: 'assets/tulsa.jpg',
      name: 'Tulsa King',
      movieType: "Action ⦿ Crime",
      moviePlatform: MoviePlatform.paramount),
];

enum MoviePlatform { netflix, paramount }
