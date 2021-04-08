import 'package:dio/dio.dart';
import 'package:meme_generator_application/domain/meme/meme_data_model.dart';

class MemeRepository {
  Dio dio = Dio();

  Future<MemeDataModel> getComicAt(int page) async {
    Response response;

    try {
      response = await dio.get("https://xkcd.com/${page}/info.0.json");
      var _data = MemeDataModel.fromJson(response.data);
      return _data;
    } catch (e) {}
  }
}
