import 'package:exam_nexteons/model/model.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class GlobalGalleryController extends GetxController {
  final Dio dio = Dio();
  final data = <GlobalGalleryItem>[].obs;

  final error = ''.obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  Future<void> fetchData() async {
    try {
      final String url = 'https://ajcjewel.com:4000/api/global-gallery/list';
      final String token =
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfdXNlcklkXyI6IjYzMDI2ZjIxNWE5ZDVjNDY1NzQ3MTMxYSIsIl9lbXBsb3llZUlkXyI6IjYzMDI2ZjIxYTI1MTZhMTU0YTUxY2YxOSIsIl91c2VyUm9sZV8iOiJzdXBlcl9hZG1pbiIsImlhdCI6MTcxMTQ0NTY1OSwiZXhwIjoxNzQyOTgxNjU5fQ.lE1Gbdm8YZ6Fany4184Pb7kSUg-z6Rk8Ag1irB3fstc";
      final Options options = Options(headers: {
        'Authorization': 'Bearer $token',
      });

      final response = await dio.post(url, options: options, data: {
        "statusArray": [1],
        "screenType": [],
        "responseFormat": [],
        "globalGalleryIds": [],
        "categoryIds": [],
        "docTypes": [],
        "types": [],
        "limit": 10,
        "skip": 0,
        "searchingText": ""
      });

      if (response.statusCode == 200) {
        final List<dynamic> dataList = response.data['data']['list'];
        data.assignAll(
            dataList.map((json) => GlobalGalleryItem.fromJson(json)).toList());
      } else {
        error.value = 'Error ${response.statusCode}';
      }
    } catch (e) {
      error.value = 'Error: $e';
    } finally {}
  }

  String getDocumentType(int type) {
    switch (type) {
      case 0:
        return 'Image';
      case 1:
        return 'Video';
      case 2:
        return 'PDF';
      case 3:
        return 'Audio';
      case 4:
        return 'Document';
      default:
        return 'Unknown';
    }
  }
}
