import 'dart:io';
import 'package:path_provider/path_provider.dart';

void handleException(dynamic error, StackTrace stackTrace) async {
  // Get the current date and time
  DateTime now = DateTime.now();
  String formattedDate =
      '${now.year}-${now.month}-${now.day}_${now.hour}-${now.minute}-${now.second}';

  // Get the documents directory using path_provider
  Directory documentsDirectory = await getApplicationDocumentsDirectory();

  // Create the file with the current date and time in the file name
  File file = File('${documentsDirectory.path}/error_log_$formattedDate.txt');

  // Open the file in write mode, and append the exception information
  file.writeAsStringSync('Exception: $error\nStack Trace:\n$stackTrace\n\n',
      mode: FileMode.append);

  // You can also log the exception to the console
  print('Exception: $error\nStack Trace:\n$stackTrace');
}
