# sharepoint_auth example

Get sharepoint access token package to access SHAREPOINT REST API.


For using this library you have to create an azure app at the [Azure App registration portal](https://apps.dev.microsoft.com/). Use native app as plattform type.

Register App on Sharepoint Site by using : https://YourDomainName.SharePoint.com/sites/YourSiteName/_layouts/15/appregnew.aspx

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

Tokens have expire offset of `1800 secs`:

```dart
await sharepointauth.logout();
```

## 💻 Installation

Add the following to your pubspec.yaml dependencies:

```yaml
dependencies:
  sharepoint_auth: "^0.0.2"
```


## Questions?🤔

Hit me on twitter [![Twitter URL](https://img.shields.io/twitter/follow/luv4ever2shail.svg?style=social)](https://twitter.com/luv4ever2shail)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-ShailPatel-blue.svg)](https://www.linkedin.com/in/shailkumarpatel/)

