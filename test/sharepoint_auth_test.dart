import 'package:flutter_test/flutter_test.dart';
import 'package:sharepoint_auth/model/config.dart';
import 'package:sharepoint_auth/sharepoint_auth.dart';

void main() {
  test('adds one to input values', () {
    final SharepointConfig config = new SharepointConfig(
      "Sharepoint Client Id",
      "Sharepoint Client Secret",
      "Sharepoint Resource",
      "Sharepoint Site",
      "Your Tenant Id",
    );
    final Sharepointauth sharepointauth = new Sharepointauth(config);
  });
}
