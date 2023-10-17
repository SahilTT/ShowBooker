import 'package:flutter/material.dart';
import 'package:show_booker/widgets/lottie_progressdialog.dart';

bool _isShowing = false;
late BuildContext _context,_dismissingContext;
bool _barrierDismissible = false;

class CustomProgressDialog {

  CustomProgressDialog(BuildContext context,
      {bool? isDismissible,String? message}) {
    _context = context;
    _dismissingContext = context;
    _barrierDismissible = isDismissible ?? false;
  }

  bool isShowing() {
    return _isShowing;
  }

  Future<bool> hide() async {
    try {
      if (_isShowing) {
        _isShowing = false;
        Navigator.of(_dismissingContext).pop();
        debugPrint('ProgressDialog dismissed');
        return Future.value(true);
      } else {
        debugPrint('ProgressDialog already dismissed');
        return Future.value(false);
      }
    } catch (err, stacktrace) {
      debugPrint('Seems there is an issue hiding dialog');
      debugPrint(err.toString());
      print(stacktrace.toString());

      return Future.value(false);
    }
  }

  Future<bool> show() async {
    try {
      if (!_isShowing) {
        var _dialog = new LottieProgressDialogWidget();
        showDialog<dynamic>(
          context: _context,
          barrierDismissible: _barrierDismissible,
          builder: (BuildContext context) {
            // _dismissingContext = context;
            return WillPopScope(
              onWillPop: () async => _barrierDismissible,
              child: Dialog(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  child:_dialog),
            );
          },
        );

        debugPrint('ProgressDialog shown');
        _isShowing = true;
        return true;
      } else {
        debugPrint("ProgressDialog already shown/showing");
        return false;
      }
    } catch (err,stacktrace) {
      _isShowing = false;
      debugPrint('Exception while showing the dialog');
      debugPrint(err.toString());

      return false;
    }
  }
}