import 'package:dartz/dartz.dart';
import 'package:islamic_calander/core/Errors/failure.dart';
import 'package:islamic_calander/features/date_year/data/models/date_info_model.dart';

abstract class DateInfoRepo {
  Future<Either<Failure, List<DateInfoModel>>> getDateInfoYear(int year);
}
