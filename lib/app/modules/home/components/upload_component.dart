import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:http_parser/http_parser.dart';

class UploadComponent extends StatelessWidget {
  const UploadComponent({Key key, this.onFileAdded}) : super(key: key);

  final Function(MultipartFile) onFileAdded;

  @override
  Widget build(BuildContext context) {
    DropzoneViewController drop$;
    bool isLoading = false;
    return AlertDialog(
      actions: [
        // TextButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        //   child: Text('Confirmar'),
        // ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancelar'),
        ),
      ],
      content: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            height: 200,
            width: MediaQuery.of(context).size.width * .95,
            color: Colors.grey[200],
            child: DropzoneView(
              onCreated: (controller) => drop$ = controller,
              onDrop: (file) async {
                if (!isLoading) {
                  isLoading = true;
                  debugPrint('Dropzone rodou');
                  final imageData = await drop$.getFileData(file);
                  final imageName = await drop$.getFilename(file);
                  final fileMime = await drop$.getFileMIME(file);
                  final splittedMime = fileMime.split('/');

                  final uploadFile = MultipartFile.fromBytes(imageData,
                      filename: imageName,
                      contentType: MediaType(splittedMime[0], splittedMime[1]));
                  // onFileAdded(uploadFile);
                  Navigator.pop(context, uploadFile);
                }
              },
              operation: DragOperation.copy,
            ),
          ),
          Text('Solte o arquivo aqui'),
        ],
      ),
    );
  }
}
