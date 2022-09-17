class TrendingMangasModel {
  List<Manga>? mangas;

  TrendingMangasModel({this.mangas});

  TrendingMangasModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      mangas = <Manga>[];
      json['data'].forEach((v) {
        mangas!.add(Manga.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mangas != null) {
      data['data'] = mangas!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Manga {
  String? id;
  String? type;
  Links? links;
  Attributes? attributes;

  Manga({this.id, this.type, this.links, this.attributes});

  Manga.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    links = json['links'] != null ? Links.fromJson(json['links']) : null;
    attributes = json['attributes'] != null
        ? Attributes.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    if (links != null) {
      data['links'] = links!.toJson();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.toJson();
    }
    return data;
  }
}

class Links {
  String? self;

  Links({this.self});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['self'] = self;
    return data;
  }
}

class Attributes {
  String? createdAt;
  String? updatedAt;
  String? slug;
  String? synopsis;
  String? description;
  Titles? titles;
  String? canonicalTitle;
  List<String>? abbreviatedTitles;
  String? averageRating;
  String? startDate;
  String? endDate;
  PosterImage? posterImage;
  CoverImage? coverImage;

  Attributes(
      {this.createdAt,
      this.updatedAt,
      this.slug,
      this.synopsis,
      this.description,
      this.titles,
      this.canonicalTitle,
      this.abbreviatedTitles,
      this.averageRating,
      this.startDate,
      this.endDate,
      this.posterImage,
      this.coverImage});

  Attributes.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    slug = json['slug'];
    synopsis = json['synopsis'];
    description = json['description'];
    titles = json['titles'] != null ? Titles.fromJson(json['titles']) : null;
    canonicalTitle = json['canonicalTitle'];
    abbreviatedTitles = json['abbreviatedTitles'].cast<String>();
    averageRating = json['averageRating'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    posterImage = json['posterImage'] != null
        ? PosterImage.fromJson(json['posterImage'])
        : null;
    coverImage = json['coverImage'] != null
        ? CoverImage.fromJson(json['coverImage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['slug'] = slug;
    data['synopsis'] = synopsis;
    data['description'] = description;
    if (titles != null) {
      data['titles'] = titles!.toJson();
    }
    data['canonicalTitle'] = canonicalTitle;
    data['abbreviatedTitles'] = abbreviatedTitles;
    data['averageRating'] = averageRating;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    if (posterImage != null) {
      data['posterImage'] = posterImage!.toJson();
    }
    if (coverImage != null) {
      data['coverImage'] = coverImage!.toJson();
    }
    return data;
  }
}

class Titles {
  String? enUs;
  String? zhCn;

  Titles({this.enUs, this.zhCn});

  Titles.fromJson(Map<String, dynamic> json) {
    enUs = json['en_us'];
    zhCn = json['zh_cn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['en_us'] = enUs;
    data['zh_cn'] = zhCn;
    return data;
  }
}

class PosterImage {
  String? tiny;
  String? large;
  String? small;
  String? medium;
  String? original;

  PosterImage({this.tiny, this.large, this.small, this.medium, this.original});

  PosterImage.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'];
    large = json['large'];
    small = json['small'];
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tiny'] = tiny;
    data['large'] = large;
    data['small'] = small;
    data['medium'] = medium;
    data['original'] = original;
    return data;
  }
}

class CoverImage {
  String? tiny;
  String? large;
  String? small;
  String? original;

  CoverImage({this.tiny, this.large, this.small, this.original});

  CoverImage.fromJson(Map<String, dynamic> json) {
    tiny = json['tiny'];
    large = json['large'];
    small = json['small'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tiny'] = tiny;
    data['large'] = large;
    data['small'] = small;
    data['original'] = original;
    return data;
  }
}
