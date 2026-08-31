
import 'package:matrimony_app/provider/register_provider.dart';
import 'package:matrimony_app/provider/shortlist_provider.dart';
import 'package:matrimony_app/provider/home_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class MultiProviderList {
  static List<SingleChildWidget> providerList = [
    ChangeNotifierProvider(create: (_) => RegisterProvider()),
    ChangeNotifierProvider(create: (_) => HomeProvider()),
    ChangeNotifierProvider(create: (_) => ShortlistProvider()),
  ];
}
