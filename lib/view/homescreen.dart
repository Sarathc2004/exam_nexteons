import 'package:exam_nexteons/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class homescreen extends StatelessWidget {
  final controller = Get.put(GlobalGalleryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Global Gallery'),
      ),
      body: Obx(() {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal, // Enable horizontal scrolling
          child: SingleChildScrollView(
            child: DataTable(
              columns: [
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('UID')),
                DataColumn(label: Text('Document Type')),
                DataColumn(label: Text('URL')),
              ],
              rows: List<DataRow>.generate(
                controller.data.length,
                (index) {
                  final item = controller.data[index];
                  return DataRow(
                    cells: [
                      DataCell(Text(item.name)),
                      DataCell(Text(item.uid.toString())),
                      DataCell(Text(controller.getDocumentType(item.docType))),
                      DataCell(Text(item.url)),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }),
    );
  }
}
