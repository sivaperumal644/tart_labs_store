class HttpUrls {
  static const loginUrl = '/oauth/token';
  static const getAppsUrl = '/api/v1/client/apps';
  static const profileUrl = '/api/v1/client/my-profile';
  static const refreshTokenUrl = '/oauth/token';
  static getSharableLink(int id) => '/api/v1/client/app-url/$id';
}
