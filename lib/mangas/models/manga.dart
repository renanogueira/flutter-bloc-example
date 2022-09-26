import 'package:equatable/equatable.dart';

class Manga extends Equatable {
  final String id;
  final Attributes attributes;

  const Manga({
    required this.id,
    required this.attributes,
  });

  Manga.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        attributes = Attributes.fromJson(json['attributes']);

  @override
  List<Object?> get props => [id, attributes];
}

class Attributes {
  final String canonicalTitle;
  final String averageRating;
  final PosterImage posterImage;

  const Attributes({
    required this.canonicalTitle,
    required this.averageRating,
    required this.posterImage,
  });

  Attributes.fromJson(Map<String, dynamic> json)
      : canonicalTitle = json['canonicalTitle'],
        averageRating = json['averageRating'],
        posterImage = PosterImage.fromJson(json['posterImage']);
}

class PosterImage {
  final String tiny;
  final String large;
  final String small;
  final String medium;
  final String original;

  PosterImage({
    required this.tiny,
    required this.large,
    required this.small,
    required this.medium,
    required this.original,
  });

  PosterImage.fromJson(Map<String, dynamic> json)
      : tiny = json['tiny'],
        large = json['large'],
        small = json['small'],
        medium = json['medium'],
        original = json['original'];
}
