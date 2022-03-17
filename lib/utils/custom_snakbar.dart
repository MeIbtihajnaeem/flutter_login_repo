// import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class CustomSnakBar {
  void showSnakBarError(context, message) {
    showTopSnackBar(
      context,
      CustomSnackBar.error(
        message: message,
      ),
    );
  }

  void showSnakBarSuccess(context, message) {
    showTopSnackBar(
      context,
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  void showSnakBarInfo(context, message) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(
        message: message,
      ),
    );
  }
}
