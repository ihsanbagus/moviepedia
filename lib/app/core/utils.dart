enum MovieCategory { nowPlaying, popular, topRated }

extension MovieExtension on MovieCategory {
  String get alias {
    switch (this) {
      case MovieCategory.nowPlaying:
        return 'now_playing';
      case MovieCategory.popular:
        return 'popular';
      case MovieCategory.topRated:
        return 'top_rated';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case MovieCategory.nowPlaying:
        return 'Now Playing';
      case MovieCategory.popular:
        return 'Popular';
      case MovieCategory.topRated:
        return 'Top Rated';
      default:
        return '';
    }
  }
}
