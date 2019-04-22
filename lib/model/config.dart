class SharepointConfig {
  final String sharepointClientId;
  String sharepointtenantidUrl;
  String sharepointtokenUrl;
  final String sharepointClientSecret;
  final String sharepointSite;
  final String tenantId;
  final String responseType;
  final String contentType;
  final String sharepointResource;

  SharepointConfig(
    this.sharepointClientId,
    this.sharepointClientSecret,
    this.sharepointResource,
    this.sharepointSite,
    this.tenantId, {
    this.responseType = "code",
    this.contentType = "application/x-www-form-urlencoded",
  }) {
    this.sharepointtenantidUrl =
        "https://$sharepointSite/sharepoint.com/_vti_bin/client.svc/";
    this.sharepointtokenUrl =
        "https://accounts.accesscontrol.windows.net/$tenantId/tokens/OAuth/2";
  }
}
