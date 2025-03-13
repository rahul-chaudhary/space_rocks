import 'package:flutter/material.dart';
import 'package:space_rocks/utils/helpers/db_print.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> urlLauncher(String url, BuildContext context) async {
  try {
    final parsedUrl = Uri.tryParse(url);

    if (parsedUrl == null || !parsedUrl.hasScheme) {
      throw 'Invalid URL: $url';
    }

    if (await canLaunchUrl(parsedUrl)) {
      await launchUrl(
        parsedUrl,
        mode: LaunchMode.externalApplication, // Force browser opening
      );
    } else {
      // Show error to user instead of throwing
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Could not open $url'),
          backgroundColor: Colors.red,
        ),
      );
    }
  } catch (e) {
    dbPrint('URL launch error: $e');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Error opening link: ${e.toString()}'),
        backgroundColor: Colors.red,
      ),
    );
  }
}