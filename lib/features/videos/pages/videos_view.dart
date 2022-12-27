import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:smatch_managment/core/utils/extention.dart';
import 'package:smatch_managment/core/widgets/dialog_widget.dart';

import '../provider/videos_provider.dart';

class VideosView extends StatefulWidget {
  const VideosView({super.key});

  @override
  State<VideosView> createState() => _VideosViewState();
}

class _VideosViewState extends State<VideosView> {
  double progress = 0.0;
  bool check = false;
  List<int> selectCheckList = [];

  List videos = [{}];

  @override
  Widget build(BuildContext context) {
    final VideosProvider videosProvider = context.read<VideosProvider>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        head(),
        Expanded(
          child: ListView.builder(
              itemCount: 30,
              itemBuilder: (context, index) {
                return item(index);
              }),
        ),
      ],
    );
  }

  item(int index) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Theme(
              data: ThemeData(
                primarySwatch: Colors.blue,
                unselectedWidgetColor: Colors.grey, // Your color
              ),
              child: Checkbox(
                value: selectCheckList.contains(index),
                onChanged: (value) {
                  setState(() {
                    // check = value!;
                    if (value == true) {
                      if (!selectCheckList.contains(index)) {
                        selectCheckList.add(index);
                      }
                    } else {
                      selectCheckList.remove(index);
                    }
                  });
                },
              ),
            ),
            10.width,
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            "assets/images/raster/avatar-1.png",
                            height: 75,
                          ),
                          Positioned(
                            bottom: 5,
                            right: 5,
                            child: Container(
                                padding: const EdgeInsets.all(2.5),
                                color: Colors.black.withOpacity(0.7),
                                child: const Text(
                                  "1:34",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                      20.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Vidéo",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                          5.height,
                          const Text(
                            "Ajoutez une description",
                            style: TextStyle(
                              fontSize: 11,
                              color: Color.fromARGB(255, 111, 110, 110),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            10.width,
            const SizedBox(
              width: 100,
              child: Text(
                "Brouillon",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(168, 168, 168, 1),
                ),
              ),
            ),
            10.width,
            const SizedBox(
              width: 100,
              child: Text(
                "Aucune",
                style: TextStyle(
                  fontSize: 14,
                  color: Color.fromRGBO(168, 168, 168, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  head() {
    return Row(
      children: [
        Theme(
          data: ThemeData(
            primarySwatch: Colors.blue,
            unselectedWidgetColor: Colors.grey, // Your color
          ),
          child: Checkbox(
            value: check,
            onChanged: (value) {
              setState(() {
                check = value!;
                List.generate(
                    30,
                    (index) => {
                          print(index),
                          if (value == true)
                            {
                              if (!selectCheckList.contains(index))
                                {selectCheckList.add(index)}
                            }
                          else
                            {selectCheckList.clear()}
                        });
              });
            },
          ),
        ),
        10.width,
        const Expanded(
          child: Text(
            "Vidéo",
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(168, 168, 168, 1),
            ),
          ),
        ),
        10.width,
        const SizedBox(
          width: 100,
          child: Text(
            "Visibilité",
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(168, 168, 168, 1),
            ),
          ),
        ),
        10.width,
        const SizedBox(
          width: 100,
          child: Text(
            "Restrictions",
            style: TextStyle(
              fontSize: 14,
              color: Color.fromRGBO(168, 168, 168, 1),
            ),
          ),
        ),
      ],
    );
  }

  qwerty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DataTable(
          columns: [
            DataColumn(
              numeric: true,
              label: Checkbox(
                value: check,
                onChanged: (value) {
                  setState(() {
                    check = value!;
                  });
                  if (value == true) {
                    if (selectCheckList.contains(value)) {}
                  } else {
                    selectCheckList.clear();
                  }
                },
              ),
            ),
            DataColumn(label: Text("Vidéo")),
            DataColumn(label: Text("Visibilité")),
            DataColumn(label: Text("Restrictions")),
            DataColumn(label: Text("Date")),
          ],
          rows: [
            DataRow(cells: [
              DataCell(
                Checkbox(
                  value: check,
                  onChanged: (value) {
                    setState(() {
                      check = value!;
                    });
                    if (value == true) {
                      if (selectCheckList.contains(value)) {}
                    } else {
                      selectCheckList.clear();
                    }
                  },
                ),
              ),
              DataCell(Text("QWERTY")),
              DataCell(Text("AZERTY")),
              DataCell(Text("QAZERTY")),
              DataCell(Text("QAZERTY")),
            ])
          ],
        ),
      ],
    );
  }

  isEmpty() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Aucun contenu disponible",
          style: TextStyle(
            fontSize: 15,
            color: Color.fromRGBO(168, 168, 168, 1),
          ),
        ),
        20.height,
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 23, 33, 136),
          ),
          onPressed: () {
            DialogWidget.addVideoDialog(
                context: context,
                onPressed: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: true,
                    // type: FileType.image,
                    // allowedExtensions: [
                    //   'jpg',
                    //   'pdf',
                    //   'doc'
                    // ],
                  );

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
                });
          },
          child: const Text(
            "Importer une vidéo",
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }
}
