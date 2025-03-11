import 'dart:convert';
import 'package:http/http.dart' as http;

// Fetch YouTube thumbnail URL asynchronously
Future<String?> getYoutubeThumbnail(String videoUrl) async {
  final videoId = getYoutubeVideoId(videoUrl);
  if (videoId == null) return null;

  // Construct the YouTube thumbnail URL
  return 'https://img.youtube.com/vi/$videoId/0.jpg'; // Default YouTube thumbnail
}

// Extract YouTube video ID from the URL
String? getYoutubeVideoId(String url) {
  final uri = Uri.tryParse(url);
  if (uri == null ||
      !(uri.host.contains('youtube.com') || uri.host.contains('youtu.be'))) {
    return null;
  }

  if (uri.host == 'youtu.be') {
    return uri.pathSegments.isNotEmpty ? uri.pathSegments[0] : null;
  }

  if (uri.queryParameters.containsKey('v')) {
    return uri.queryParameters['v'];
  }

  return null;
}

Future<String?> fetchYouTubeVideoTitle(String videoUrl) async {
  try {
    // Extract the video ID from the YouTube URL
    final videoId = getYoutubeVideoId(videoUrl);
    if (videoId == null) {
      return null; // Return null if video ID extraction fails
    }

    // Fetch video details using YouTube's oEmbed API
    final oEmbedUrl =
        'https://www.youtube.com/oembed?url=https://www.youtube.com/watch?v=$videoId&format=json';
    final response = await http.get(Uri.parse(oEmbedUrl));

    if (response.statusCode == 200) {
      // Parse the response body and get the video title
      final data = json.decode(response.body);
      return data['title'];
    } else {
      // Handle error if the response is not successful
      return null;
    }
  } catch (error) {
    // Handle network or parsing errors
    return null;
  }
}
