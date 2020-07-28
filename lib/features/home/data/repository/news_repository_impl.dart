import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/news_data.dart';
import '../../domain/repository/news_data_repository.dart';
import '../datasource/news_local_data_source.dart';
import '../datasource/news_remote_data_source.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsRemoteDataSource remoteDataSource;
  final NewsLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  NewsRepositoryImpl({
    @required this.remoteDataSource,
    @required this.localDataSource,
    @required this.networkInfo,
  });
  @override
  Future<Either<Failure, News>> getNews() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteData = await remoteDataSource.getNews();
        localDataSource.cacheData(remoteData);
        return Right(remoteData);
      } on ServerException catch (e) {
        return Left(
          ServerError(
            message: e.toString(),
          ),
        );
      }
    } else {
      try {
        final cacheData = await localDataSource.getCachedData();
        return Right(cacheData);
      } on CacheException catch (e) {
        return Left(
          CacheError(
            message: e.toString(),
          ),
        );
      }
    }
  }

  @override
  List<Object> get props => [remoteDataSource, localDataSource, networkInfo];

  @override
  bool get stringify => throw UnimplementedError();
}
