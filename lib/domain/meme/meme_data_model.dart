class MemeDataModel {
  String month;
  String link;
  String year;
  String news;
  String safeTitle;
  String transcript;
  String alt;
  String img;
  String title;
  String day;

  MemeDataModel(
      {this.month,
      this.link,
      this.year,
      this.news,
      this.safeTitle,
      this.transcript,
      this.alt,
      this.img,
      this.title,
      this.day});

  MemeDataModel.fromJson(Map<String, dynamic> json) {
    month = json['month'];
    link = json['link'];
    year = json['year'];
    news = json['news'];
    safeTitle = json['safe_title'];
    transcript = json['transcript'];
    alt = json['alt'];
    img = json['img'];
    title = json['title'];
    day = json['day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['month'] = this.month;
    data['link'] = this.link;
    data['year'] = this.year;
    data['news'] = this.news;
    data['safe_title'] = this.safeTitle;
    data['transcript'] = this.transcript;
    data['alt'] = this.alt;
    data['img'] = this.img;
    data['title'] = this.title;
    data['day'] = this.day;
    return data;
  }
}
