import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:frontend/app/modules/home/components/upload_component.dart';
import 'package:frontend/app/modules/home/home_controller.dart';
import 'package:frontend/app/shared/models/file_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller;

  @override
  void initState() {
    controller = context.read<HomeController>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.user.name),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () async {
              final MultipartFile uploadFile = await showDialog(
                context: context,
                builder: (context) => UploadComponent(),
              );
              controller.setUploadFile(uploadFile);
              controller.uploadFile();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ValueListenableBuilder<List<FileModel>>(
          valueListenable: controller.files$,
          builder: (_, value, __) {
            if (value == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: value.length,
                separatorBuilder: (_, __) => Divider(),
                itemBuilder: (_, index) => ListTile(
                  title: Text(value[index].fileName),
                  subtitle: Text(value[index].format),
                  trailing: Text(value[index].size),
                  leading: Icon(Icons.file_copy),
                  onTap: () {
                    launch(
                        'http://192.168.1.150:3000/${value[index].filePath}');
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
