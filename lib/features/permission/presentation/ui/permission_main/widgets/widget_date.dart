import 'package:intl/intl.dart';

String formatDate(String dateString) {
  try {
    // Adjust format according to your input
    final parsedDate = DateFormat('dd-MM-yy').parse(dateString);
    return DateFormat('dd-MMM-yyyy').format(parsedDate);
  } catch (e) {
    return dateString;
  }
}