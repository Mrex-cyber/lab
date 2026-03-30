import 'dart:io' show Platform;

bool nativeMobileHost() => Platform.isAndroid || Platform.isIOS;
