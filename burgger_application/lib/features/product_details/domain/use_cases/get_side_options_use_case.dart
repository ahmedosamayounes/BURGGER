import '../../../../core/networking/api_result.dart';
import '../entities/option_entity.dart';
import '../repositories/side_options_repository.dart';

class GetSideOptionsUseCase {
  final SideOptionsRepository repository;

  GetSideOptionsUseCase(this.repository);

  Future<ApiResult<List<OptionEntity>>> call() async {
    return await repository.getSideOptions();
  }
}