import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:islamic_calander/core/Errors/failure.dart';
import 'package:islamic_calander/core/enums/month_enums.dart';
import 'package:islamic_calander/core/enums/moon_phase_enums.dart';
import 'package:islamic_calander/core/heleprs/print_helper.dart';
import 'package:islamic_calander/features/date_info/data/data_source/date_info_remote_data_source.dart';
import 'package:islamic_calander/features/date_info/data/models/date_info_model.dart';
import 'package:islamic_calander/features/date_info/domain/repo/date_year_repo.dart';

class DateInfoRepoImpl implements DateInfoRepo {
  final DateInfoRemoteDataSource dateInfoRemoteDataSource;

  DateInfoRepoImpl({required this.dateInfoRemoteDataSource});
  @override
  Future<Either<Failure, List<DateInfoModel>>> getDateInfoYear(int year) async {
    final t = prt('getDateInfoYear - DateInfoRepoImpl');
    try {
      List<DateInfoModel> models = await dateInfoRemoteDataSource.getDateInfoYear(year);
      pr(models, t);
      return Right(models);
    } catch (e) {
      if (e is DioException) {
        pr('DioException occured : ${e.response?.data}', t);
        return Left(ServerFailure.formDioError(e));
      }
      pr('Exception occured : $e', t);
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<DateInfoModel>>> getDateInfoMonth(int year, MonthEnum month) async {
    final t = prt('getDateInfoYear - DateInfoRepoImpl');
    try {
      List<DateInfoModel> models = await dateInfoRemoteDataSource.getDateInfoMonth(year, month);
      pr(models, t);
      return Right(models);
    } catch (e) {
      if (e is DioException) {
        pr('DioException occured : ${e.response?.data}', t);
        return Left(ServerFailure.formDioError(e));
      }
      pr('Exception occured : $e', t);
      return Left(ServerFailure(e.toString()));
    }
  }

  // catch (e) {
  //   if (e is DioException) {
  //     pr('DioException occured : ${e.response?.data}', t);
  //     return Left(ServerFailure.formDioError(e));
  //   }
  //   pr('Exception occured : $e', t);
  //   return Left(ServerFailure(e.toString()));
  // }
  // }
  @override
  Future<Either<Failure, List<DateInfoModel>>> getMoonInfoMonth(int year, MoonPhaseEnum moonPhase) async {
    final t = prt('getMoonInfoMonth - DateInfoRepoImpl');
    try {
      List<DateInfoModel> models = await dateInfoRemoteDataSource.getMoonInfoMonth(year, moonPhase);
      pr(models, t);
      return Right(models);
    } catch (e) {
      if (e is DioException) {
        pr('DioException occured : ${e.response?.data}', t);
        return Left(ServerFailure.formDioError(e));
      }
      pr('Exception occured : $e', t);
      return Left(ServerFailure(e.toString()));
    }
  }
}
