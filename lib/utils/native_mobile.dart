import 'package:flutter/foundation.dart';

import 'native_mobile_io.dart' if (dart.library.html) 'native_mobile_stub.dart';

bool isNativeMobile() => !kIsWeb && nativeMobileHost();
