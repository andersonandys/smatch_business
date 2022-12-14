import 'package:desktop_drop/desktop_drop.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:cross_file/cross_file.dart';

class AddVideo extends StatefulWidget {
  const AddVideo({super.key});

  @override
  State<AddVideo> createState() => _AddVideoState();
}

class _AddVideoState extends State<AddVideo> {
  final List<XFile> _list = [];

  bool _isDragOver = false;

  Offset? offset;

  @override
  Widget build(BuildContext context) {
    return DropTarget(
      onDragUpdated: (details) {
        setState(() {
          offset = details.localPosition;
        });
      },
      onDragEntered: (detail) {
        setState(() {
          _isDragOver = true;
          offset = detail.localPosition;
        });
      },
      onDragExited: (detail) {
        setState(() {
          _isDragOver = false;
          offset = null;
        });
      },
      onDragDone: (detail) async {
        debugPrint('onDragDone:');
        for (final file in detail.files) {
          setState(() {
            _list.addAll(detail.files);
          });

          debugPrint('  ${file.path} ${file.name}'
              '  ${await file.lastModified()}'
              '  ${await file.length()}'
              '  ${file.mimeType}');
        }
      },
      child: Container(
        height: 200,
        width: 200,
        color: _isDragOver ? Colors.blue.withOpacity(0.4) : Colors.black26,
        child: Stack(
          children: [
            if (_list.isEmpty)
              const Center(child: Text("Drop here"))
            else
              Text(_list.map((e) => e.path).join("\n")),
            if (offset != null)
              Align(
                alignment: Alignment.topRight,
                child: Text(
                  '$offset',
                  style: Theme.of(context).textTheme.caption,
                ),
              )
          ],
        ),
      ),
      // child: DottedBorder(
      //   color: Colors.grey[900]!,
      //   strokeWidth: 2,
      //   dashPattern: [5, 5],
      //   radius: Radius.circular(10),
      //   child: SizedBox(
      //     height: 200,
      //     child: Center(
      //       child: Text('Drag and drop video here'),
      //     ),
      //   ),
      // ),
    );
  }
}
