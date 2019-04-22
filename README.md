# sharepoint_auth

Get sharepoint access token package to access SHAREPOINT REST API.


# Sharepoint Access Token

A Flutter sharepoint_auth package for performing authentication to retrieve access token for accessing SHAREPOINT REST API by using OAuth2 v2.0 endpoint. Forked from [Earlybyte.aad_oauth](https://github.com/Earlybyte/aad_oauth).

## Usage

For using this library you have to create an azure app at the [Azure App registration portal](https://apps.dev.microsoft.com/). Use native app as plattform type (with callback URL: https://login.live.com/oauth20_desktop.srf).

Register App on Sharepoint Site by using : https://domain.SharePoint.com/sites/sitename/_layouts/15/appregnew.aspx

Afterwards you have to initialize the library as follow:

```dart
 final SharepointConfig config = new SharepointConfig(
      "Sharepoint Client Id",
      "Sharepoint Client Secret",
      "Sharepoint Resource",
      "Sharepoint Site",
      "Your Tenant Id",);
    final Sharepointauth sharepointauth = new Sharepointauth(config);
```

This allows you to pass in Client Id, Client Secret, Sharepoint Resource, Sharepoint Site and Tenant Id.

Then once you have an Sharepointauth instance, you can call `login()` and afterwards `getAccessToken()` to retrieve an access token:

```dart
await sharepointauth.login();
String accessToken = await sharepointauth.getAccessToken();
```

You can also call `getAccessToken()` directly. It will automatically login and retrive an access token.

Tokens are cached in memory. to destroy the tokens you can call `logout()`:

```dart
await sharepointauth.logout();
```

## Installation

Add the following to your pubspec.yaml dependencies:

```yaml
dependencies:
  sharepoint_auth: "^0.0.1"
```

