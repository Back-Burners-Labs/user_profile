import '../app_export.dart';

PreferredSizeWidget appBarEmpty() {
  return AppBar(
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    elevation: 0,
  );
}

PreferredSizeWidget appBarWithBackButton() {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: true,
    backgroundColor: Colors.transparent,
    leading: const AppBackButton(),
  );
}
