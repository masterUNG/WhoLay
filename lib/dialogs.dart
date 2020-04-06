import 'package:flutter/material.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:wholay/styles.dart';

enum DialogActions { OK, Cancel }

Future<DialogActions> confirmationDialog(
  BuildContext context,
  String title,
  String content, {
  String okText = 'OK',
  String cancelText = 'CANCEL',
  bool barrierDismissible = false,
  bool okActionOnRight = true,
}) async {
  return showDialog<DialogActions>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              Icon(Icons.warning,
                  color: Colors.amberAccent[700],
                  size: WholaySpace.headIconSize),
              horizontalSpace(14.0),
              Text(title),
            ],
          ),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: (okActionOnRight)
                  ? Text(cancelText,
                      style: TextStyle(color: WholayColors.textFader))
                  : Text(okText),
              onPressed: () {
                Navigator.of(context).pop((okActionOnRight)
                    ? DialogActions.Cancel
                    : DialogActions.OK);
              },
            ),
            FlatButton(
              child: (okActionOnRight)
                  ? Text(okText)
                  : Text(cancelText,
                      style: TextStyle(color: WholayColors.textFader)),
              onPressed: () {
                Navigator.of(context).pop((okActionOnRight)
                    ? DialogActions.OK
                    : DialogActions.Cancel);
              },
            ),
          ],
        );
      });
}

Future<void> errorDialog(
  BuildContext context,
  String title,
  String content, {
  String okText = 'OK',
  bool barrierDismissible = false,
}) async {
  return showDialog<void>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            children: <Widget>[
              Icon(
                Icons.error,
                color: Colors.red[700],
                size: WholaySpace.headIconSize,
              ),
              horizontalSpace(14.0),
              Text(title ?? 'Error'),
            ],
          ),
          content: Text(content),
          actions: <Widget>[
            FlatButton(
              child: Text(okText),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      });
}
