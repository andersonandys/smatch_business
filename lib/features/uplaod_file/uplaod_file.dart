import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

class UplaodFile extends StatefulWidget {
  const UplaodFile({Key? key}) : super(key: key);

  @override
  State<UplaodFile> createState() => _UplaodFileState();
}

class _UplaodFileState extends State<UplaodFile> {
  double progress = 0.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();

                if (result != null) {
                  Uint8List? file = result.files.first.bytes;
                  String fileName = result.files.first.name;

                  UploadTask task = FirebaseStorage.instance
                      .ref()
                      .child("files/$fileName")
                      .putData(file!);

                  task.snapshotEvents.listen((event) {
                    setState(() {
                      progress = ((event.bytesTransferred.toDouble() /
                                  event.totalBytes.toDouble()) *
                              100)
                          .roundToDouble();

                      if (progress == 100) {
                        event.ref
                            .getDownloadURL()
                            .then((downloadUrl) => print(downloadUrl));
                      }

                      print(progress);
                    });
                  });
                }
              },
              child: const Text("Upload File to Firebase Storage"),
            ),
            const SizedBox(height: 50.0),
            SizedBox(
              height: 200.0,
              width: 200.0,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 375),
                child: progress == 100.0
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.check_rounded,
                            color: Colors.green,
                          ),
                          const SizedBox(width: 5.0),
                          Text(
                            'Upload Complete',
                            style: GoogleFonts.poppins(
                              color: Colors.green,
                            ),
                          ),
                        ],
                      )
                    : LiquidCircularProgressIndicator(
                        value: progress / 100,
                        valueColor:
                            const AlwaysStoppedAnimation(Colors.pinkAccent),
                        backgroundColor: Colors.white,
                        direction: Axis.vertical,
                        center: Text(
                          "$progress%",
                          style: GoogleFonts.poppins(
                              color: Colors.black87, fontSize: 25.0),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
