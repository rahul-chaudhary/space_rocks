import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FileHandler {
  /// Downloads a file from the given [url] and opens it using `open_file`.
  static Future<void> openFileFromUrl(String url, {String? fileName}) async {
    try {
      // Get the temporary directory of the device.
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/${fileName ?? url.split('/').last}';

      // Download the file.
      final response = await Dio().download(url, filePath);

      if (response.statusCode == 200) {
        // Open the file using open_file.
        final result = await OpenFile.open(filePath);
        debugPrint('File opened with result: ${result.message}');
      } else {
        debugPrint('Failed to download file: ${response.statusCode}');
      }
    } catch (e) {
      debugPrint('Error downloading or opening file: $e');
    }
  }
}
