import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../entities/news_data.dart';

abstract class NewsRepository extends Equatable {
  Future<Either<Failure, News>> getNews();
}
