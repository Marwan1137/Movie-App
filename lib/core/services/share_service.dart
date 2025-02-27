import 'package:injectable/injectable.dart';
import 'package:share_plus/share_plus.dart';

@injectable
class ShareService {
  // Method to share movie details
  Future<void> shareMovie({
    required String title,
    required String overview,
  }) async {
    try {
      final String shareText = '''
Check out this movie!
$title
$overview

''';
      await Share.share(
        shareText,
        subject: title,
      );
    } catch (e) {
      throw Exception('Failed to share movie: $e');
    }
  }

  // Method specifically for sharing to WhatsApp
  Future<void> shareToWhatsApp({
    required String title,
    required String overview,
  }) async {
    try {
      final String shareText = '''
Check out this movie!
$title
$overview
''';
      await Share.share(
        shareText,
        subject: title,
      );
    } catch (e) {
      throw Exception('Failed to share to WhatsApp: $e');
    }
  }
}
