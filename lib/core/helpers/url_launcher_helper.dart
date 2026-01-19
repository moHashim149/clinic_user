import 'package:url_launcher/url_launcher.dart';

class UrlLauncherHelper {
  static void launchWhatsappLink(String phoneNumber) async {
    final Uri url = Uri.parse("https://wa.me/${"+966$phoneNumber"}");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void callPhoneNumber(String phoneNumber) async {
    final Uri url = Uri.parse("tel:${"+966$phoneNumber"}");
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void openLink(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  static void openGoogleMapLink(double lat, double long) async {
    var link = "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
