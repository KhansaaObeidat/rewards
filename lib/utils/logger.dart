import 'package:logger/logger.dart';

final logger = Logger();

void logDepugMessage(String message) {
  logger.d(message);
}

void logWarningMessage(String message) {
  logger.w(message);
}

void logErrorMessage(String message) {
  logger.e(message);
}

void logInformationMessage(String message) {
  logger.i(message);
}