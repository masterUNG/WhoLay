import 'package:flutter/material.dart';
import 'package:wholay/styles.dart';
import 'package:wholay/widgets/appWidgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wholay/dialogs.dart';

class PhotoTaken extends StatefulWidget {

  final double photoHeight;
  final double photoWidth;
  final String title;
  final String noImageText;
  final double leftIndent;
  final double rightIndent;
  final double topIndent;
  final double bottomIndent;
  final String backgroundImagePath;

  PhotoTaken({
    Key key,
    this.photoHeight = 0, // 0 is Auto
    this.photoWidth = 0,  // 0 is Auto
    this.title = 'Take a photo',
    this.noImageText = 'Photo here',
    this.leftIndent,
    this.rightIndent,
    this.topIndent,
    this.bottomIndent = 0,
    this.backgroundImagePath
  }) : super(key: key);

  @override
  _PhotoTakenState createState() => _PhotoTakenState();
}

class _PhotoTakenState extends State<PhotoTaken> {

  Image _img;

  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _img = Image.file(image);
    });
  }

  Future selectImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _img = Image.file(image);
    });
  }

  Future removePhoto() async {
    if (_img != null) {
      final DialogActions act = await confirmationDialog(context, 'ลบรูป', 'คุณต้องการลบรูปภาพใช่หรือไม่?', okText: 'ใช่', cancelText: 'ไม่', okActionOnRight: false);
      if (act == DialogActions.OK) {
        setState(() {
          _img = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {

    double _left = (widget.leftIndent) ?? (WholaySpace.edgeHorizontal);
    double _right = (widget.rightIndent) ?? (WholaySpace.edgeHorizontal);
    double _top = (widget.topIndent) ?? (WholaySpace.edgeHorizontal);
    double _bottom = (widget.bottomIndent) ?? 0;
    double _scrWdt = MediaQuery.of(context).size.width;
    double _height = ((widget.photoHeight == 0) || (widget.photoHeight == null)) ? _scrWdt + (_scrWdt * 1/50) : widget.photoHeight;
    Image _bgImg = ((widget.backgroundImagePath != null) && (widget.backgroundImagePath.trim().isNotEmpty)) ? Image.asset(widget.backgroundImagePath) : null;

    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(_left, _top, _right, 0.0),
          child: Align(alignment: Alignment.centerLeft, child: Text(widget.title, style: controlMajorTitleStyle(context))),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(_left, 10.0, _right, 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.delete, color: Colors.red[200], size: 28.0),
                    horizontalSpace(6.0),
                    Text(
                      'ลบรูป',
                      style: TextStyle(
                        fontFamily: dataInfoLabelStyle(context).fontFamily,
                        fontSize: dataInfoLabelStyle(context).fontSize,
                        color: Colors.red[200]
                      ),
                    ),
                  ],
                ),
                onTap: () {
                  removePhoto();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo_size_select_actual, size: WholaySpace.headIconSize),
                    color: WholayColors.primary,
                    onPressed: () {selectImage();},
                  ),
                  horizontalSpace(12.0),
                  IconButton(
                    icon: Icon(Icons.camera_alt, size: WholaySpace.headIconSize),
                    color: WholayColors.primary,
                    onPressed: () {openCamera();},
                  ),
                ],
              )
            ],
          ),
        ),
        Container(
          height: _height,
          width: _scrWdt,
          child: Visibility(
            visible: (_img == null) && (_bgImg == null),
            child: Align(
              alignment: Alignment.center, 
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  widget.noImageText,
                  style: dataInfoLabelStyle(context),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            color: WholayColors.backgroundSecondary,
            // border: Border.all(color: WholayColors.controlBorder, width: 1.0),
            image: (_img != null) ?
              DecorationImage(
                image: _img.image,
                fit: BoxFit.cover
              ) : ((_bgImg != null) ? 
              DecorationImage(
                image: _bgImg.image,
                fit: BoxFit.cover
              ) : null),
          ),          
        ),
        verticalSpace(_bottom),
      ],
    );
  }
}