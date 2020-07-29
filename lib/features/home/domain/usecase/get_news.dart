import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/news_data.dart';
import '../repository/news_data_repository.dart';

@Injectable(as: UseCase)
class GetNews implements UseCase<News, NoParams> {
  final NewsRepository repository;
  GetNews({
    @required this.repository,
  });
  @override
  Future<Either<Failure, News>> call(NoParams params) async {
    return await repository.getNews();
  }
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
