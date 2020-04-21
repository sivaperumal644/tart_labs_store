class App {
  final int id;
  final String appLogo;
  final String appName;
  final String description;
  final String createdAt;
  final String updatedAt;

  App({
    this.id,
    this.appLogo,
    this.appName,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  factory App.fromJson(Map json) {
    return App(
      id: json['id'],
      appName: json['app_name'],
      appLogo: json['app_logo'],
      description: json['app_description'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
