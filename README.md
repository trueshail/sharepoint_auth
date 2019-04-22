# sharepoint_auth

Get sharepoint access token package to access SHAREPOINT REST API.


# Sharepoint Access Token

A Flutter sharepoint_auth package for performing authentication to retrieve access token for accessing SHAREPOINT REST API by using OAuth2 v2.0 endpoint. Forked from [Earlybyte.aad_oauth](https://github.com/Earlybyte/aad_oauth).

## Usage❔

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


## 👨 Created & Maintained By

[Shail Patel](https://github.com/luv4ever2shail)

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - [PayPal](https://www.paypal.me/luv4ever2shail/)

[![Say Thanks!](https://img.shields.io/badge/Say%20Thanks-!-1EAEDB.svg)](https://saythanks.io/to/luv4ever2shail)

The source code is **100% Dart**, and everything resides in the [/lib](https://github.com/luv4ever2shail/sharepoint_auth/tree/master/lib) folder.

## Show some :heart: and star the repo to support the project

 [![GitHub followers](https://img.shields.io/github/followers/luv4ever2shail.svg?style=social&label=Follow)](https://github.com/luv4ever2shail)[![GitHub stars](https://img.shields.io/github/stars/luv4ever2shail/sharepoint_auth.svg?style=social&label=Star)](https://github.com/luv4ever2shail/sharepoint_auth) [![GitHub forks](https://img.shields.io/github/forks/luv4ever2shail/sharepoint_auth.svg?style=social&label=Fork)](https://github.com/luv4ever2shail/sharepoint_auth/fork) [![GitHub watchers](https://img.shields.io/github/watchers/luv4ever2shail/sharepoint_auth.svg?style=social&label=Watch)](https://github.com/luv4ever2shail/sharepoint_auth) 
 [![Twitter Follow](https://img.shields.io/twitter/follow/luv4ever2shail.svg?style=social)](https://twitter.com/luv4ever2shail)

 [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg?v=102)](https://opensource.org/licenses/Apache-2.0) [![License](https://img.shields.io/badge/license-Apache%202.0-blue.svg)](https://github.com/luv4ever2shail/sharepoint_auth/blob/master/LICENSE)

### :heart: Found this project useful?

If you found this project useful, then please consider giving it a :star: on Github and sharing it.

# 👍 How to Contribute

1. Fork it
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -m 'Added some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create new Pull Request

# 📃 License

  Copyright 2019 Shail Patel

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

## Questions?🤔

Hit me on twitter [![Twitter URL](https://img.shields.io/twitter/follow/luv4ever2shail.svg?style=social)](https://twitter.com/luv4ever2shail)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-ShailPatel-blue.svg)](https://www.linkedin.com/in/shailkumarpatel/)

## Getting Started

For help getting started with Flutter, view our online [documentation](https://flutter.dev/).

For help on editing package code, view the [documentation](https://flutter.dev/developing-packages/).
