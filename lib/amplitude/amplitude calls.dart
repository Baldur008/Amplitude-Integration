import 'package:amplitude_flutter/amplitude.dart';
import 'package:flutter/material.dart';

class AmplitudeCalls {
  static Future<void> call(String eventName, Map<String, dynamic>? properties,
      BuildContext context) async {
    Amplitude amplitude = Amplitude.getInstance();
    await amplitude.logEvent(eventName, eventProperties: properties);
    await amplitude.uploadEvents();
    print(eventName);
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(eventName + " Uploaded"),
        duration: Duration(milliseconds: 750),
      ),
    );
  }
}
