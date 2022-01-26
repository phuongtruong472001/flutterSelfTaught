class Film {
  final int id;
  final String name;
  final String permalink;
  final String startDate;
  final String endDate;
  final String country;
  final String network;
  final String status;
  final String image;
  Film(
      {required this.id,
      required this.name,
      required this.permalink,
      required this.startDate,
      required this.endDate,
      required this.country,
      required this.network,
      required this.status,
      required this.image});
  factory Film.fromJson(Map<String, dynamic> json) {
    return Film(
        id: json["id"],
        name: json["name"],
        permalink: json["permalink"],
        startDate: json["start_date"],
        endDate: json["end_date"],
        country: json["country"],
        network: json["network"],
        status: json["status"],
        image: json["image_thumbnail_path"]);
  }
}
