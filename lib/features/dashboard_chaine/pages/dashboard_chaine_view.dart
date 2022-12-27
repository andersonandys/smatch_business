import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:dotted_border/dotted_border.dart';
import 'package:smatch_managment/core/utils/extention.dart';
import 'package:smatch_managment/core/widgets/dialog_widget.dart';

import '../provider/dashboard_chaine_provider.dart';
import 'package:provider/provider.dart';

class DashboardChaineView extends StatefulWidget {
  const DashboardChaineView({super.key});

  @override
  State<DashboardChaineView> createState() => _DashboardChaineViewState();
}

class _DashboardChaineViewState extends State<DashboardChaineView> {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    final DashboardChaineProvider dashboardChaineProvider =
        context.read<DashboardChaineProvider>();

    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Tableau de bord de la chaîne",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          20.height,
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(62, 62, 62, 1)),
                ),
                child: DottedBorder(
                  color: const Color.fromRGBO(62, 62, 62, 1),
                  padding: const EdgeInsets.all(10),
                  strokeWidth: 2,
                  dashPattern: const [5, 5],
                  radius: const Radius.circular(10),
                  child: SizedBox(
                    height: 500,
                    width: 250,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Center(
                          child: Text(
                            "Vous voulez consulter les statistiques sur une vidéo que vous avez récemment mise en ligne ? Importez et publiez-en une pour commencer",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromRGBO(168, 168, 168, 1),
                            ),
                          ),
                        ),
                        40.height,
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 23, 33, 136),
                          ),
                          onPressed: () {
                            DialogWidget.addVideoDialog(
                                context: context,
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    allowMultiple: true,
                                    type: FileType.image,
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
                                        progress = ((event.bytesTransferred
                                                        .toDouble() /
                                                    event.totalBytes
                                                        .toDouble()) *
                                                100)
                                            .roundToDouble();

                                        if (progress == 100) {
                                          event.ref.getDownloadURL().then(
                                              (downloadUrl) =>
                                                  print(downloadUrl));
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
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              40.width,
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color.fromRGBO(62, 62, 62, 1)),
                ),
                child: SizedBox(
                  width: 325,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Données analytiques de la chaîne",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                        ),
                      ),
                      12.height,
                      const Text(
                        "Abonnés actuels",
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      5.height,
                      const Text(
                        "0",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      30.height,
                      const Divider(color: Colors.white),
                      10.height,
                      const Text(
                        "Résumé",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      5.height,
                      const Text(
                        "28 derniers jours",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      15.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Vues",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "0 —",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      15.height,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Durée de visionnage (heures)",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "0,0 —",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      25.height,
                      const Divider(color: Colors.white),
                      20.height,
                      const Text(
                        "Vidéos les plus regardées",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                      10.height,
                      const Text(
                        "Dernières 48 heures · Vues",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      30.height,
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "DONNÉES D'ANALYSE DE LA CHAÎNE",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
