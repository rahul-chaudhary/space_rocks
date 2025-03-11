import 'package:intl/intl.dart';

String? formatToDDMMYYYY(DateTime? dateTime) {
  if (dateTime == null) return null; // Handle null case
  final DateFormat formatter = DateFormat('dd-MM-yyyy');
  return formatter.format(dateTime);
}

String formatToDDMMMYYYYhhmma(DateTime? dateTime) {
  if (dateTime == null) return 'Date not available'; // Handle null case
  final DateFormat formatter = DateFormat('dd-MMM-yyyy hh:mm a');
  return formatter.format(dateTime);
}
