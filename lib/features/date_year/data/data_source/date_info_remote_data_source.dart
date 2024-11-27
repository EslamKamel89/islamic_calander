// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:islamic_calander/core/api_service/api_consumer.dart';
import 'package:islamic_calander/core/api_service/end_points.dart';
import 'package:islamic_calander/core/heleprs/print_helper.dart';
import 'package:islamic_calander/features/date_year/data/models/date_info_model.dart';

class DateInfoRemoteDataSource {
  final ApiConsumer api;
  DateInfoRemoteDataSource({
    required this.api,
  });
  Future<List<DateInfoModel>> getDateInfoYear(int year) async {
    final t = prt('getDateInfoYear - DateInfoRemoteDataSource');
    final data = await api.get(EndPoint.dateInfoEndPoint, queryParameter: {
      'year': year,
    });
    List dataList = jsonDecode(data);
    pr(dataList, '$t - raw respnose');
    List<DateInfoModel> models = dataList.map<DateInfoModel>((json) => DateInfoModel.fromJson(json)).toList();
    pr(models, '$t - parsed respnose');
    return models;
  }
}
