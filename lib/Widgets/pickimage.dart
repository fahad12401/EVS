import 'dart:convert';
import 'dart:io';
import 'package:evs/Screens/PreviewImage.dart';
import 'package:evs/Widgets/Dialogbox.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future<void> CaptureImage(BuildContext context, File yourImage) async {
  final picker = ImagePicker();
  final image = await picker.pickImage(source: ImageSource.camera);
  if (image == null) {
    MyDialog.show(context, 'Kindly Take image');
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context, rootNavigator: true).pop();
    });
  } else {
    yourImage = File(image.path);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PreviewImage(
                  capimages: yourImage,
                )));
  }
}
// class ImageButton extends StatefulWidget {
//   ImageButton({
//     super.key,
//     this.CapturedImage,
//   });

//   @override
//   State<ImageButton> createState() => _ImageButtonState();
// }

// class _ImageButtonState extends State<ImageButton> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Container(
//             height: 40.0,
//             width: double.infinity,
//             child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0)),
//                     backgroundColor: Color(0xff392850)),
//                 onPressed: () {
//                   _ModelBottomsheet(context);
//                 },
//                 child: Text(
//                   "Take Photo",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontFamily: 'Calibri',
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold),
//                 )),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             TextButton(
//                 onPressed: () {
//                   if (CapturedImage == null) {
//                     showalertdialog(context, "Image is Empty!");
//                   } else {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => PreviewImage(
//                                   capimage: CapturedImage,
//                                 )));
//                   }
//                   ;
//                 },
//                 child: Text(
//                   "--Want to Preview Your Image?",
//                   style: TextStyle(
//                     color: Colors.indigo,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 )),
//             TextButton(
//                 onPressed: () {
//                   removeImage();
//                 },
//                 child: Text(
//                   "Remove Image?",
//                   style: TextStyle(
//                     color: Colors.indigo,
//                     fontWeight: FontWeight.w400,
//                   ),
//                 )),
//           ],
//         )
//       ],
//     );
//   }
// }


