class NewsModel {
  final String title;
  final String url;
  final String timePublished;
  final String summary;
  final String bannerImage;
  final String source;

  NewsModel({
    required this.title,
    required this.url,
    required this.timePublished,
    required this.summary,
    required this.bannerImage,
    required this.source,
  });

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      title: json["title"] ?? "No Title",
      url: json["url"] ?? "",
      timePublished: json["time_published"] ?? "",
      summary: json["summary"] ?? "No Summary",
      bannerImage: json["banner_image"] ?? "",
      source: json["source"] ?? "Unknown Source",
    );
  }
}
