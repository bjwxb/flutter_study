import 'package:logger/logger.dart';

const String _tag = "logger";

var _logger = Logger(
  printer: PrettyPrinter(
      // methodCount: 0,
  ),
);

logD(String msg) {
  _logger.d("$_tag :: $msg");
}

logI(String msg) {
  _logger.i("$_tag :: $msg");
}

logW(String msg) {
  _logger.w("$_tag :: $msg");
}

logE(String msg) {
  _logger.e("$_tag :: $msg");
}