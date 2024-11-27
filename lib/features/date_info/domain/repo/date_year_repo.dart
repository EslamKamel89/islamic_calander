import 'package:dartz/dartz.dart';
import 'package:islamic_calander/core/Errors/failure.dart';
import 'package:islamic_calander/core/enums/month_enums.dart';
import 'package:islamic_calander/core/enums/moon_phase_enums.dart';
import 'package:islamic_calander/features/date_info/data/models/date_info_model.dart';

abstract class DateInfoRepo {
  Future<Either<Failure, List<DateInfoModel>>> getDateInfoYear(int year);
  Future<Either<Failure, List<DateInfoModel>>> getDateInfoMonth(int year, MonthEnum month);
  Future<Either<Failure, List<DateInfoModel>>> getMoonInfoMonth(int year, MoonPhaseEnum moonPhase);
}
