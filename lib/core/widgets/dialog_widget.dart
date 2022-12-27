import 'package:flutter/material.dart';
import 'package:smatch_managment/core/utils/extention.dart';

class DialogWidget {
  static addVideoDialog({
    required BuildContext context,
    required void Function()? onPressed,
  }) {
    return showDialog(
        context: context,
        builder: ((context) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 250,
              vertical: 50,
            ),
            color: const Color.fromRGBO(40, 40, 40, 1),
            height: 500,
            width: 200,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        "Importer des vidéos",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: const Icon(Icons.close),
                      // )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,
                  height: 0.2,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Glissez-déposez les fichiers vidéo que vous souhaitez mettre en ligne",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      5.height,
                      const Text(
                        "Vos vidéos resteront privées jusqu'à leur publication.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      15.height,
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(69, 168, 252, 1),
                        ),
                        onPressed: onPressed,
                        child: const Text(
                          "SELECTIONNER DES FICHIERS",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
