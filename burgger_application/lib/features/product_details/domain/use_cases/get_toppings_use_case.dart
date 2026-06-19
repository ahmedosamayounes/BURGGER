import '../../../../core/networking/api_result.dart';
import '../entities/option_entity.dart';
import '../repositories/toppings_repository.dart';

class GetToppingsUseCase {
  final ToppingsRepository repository;

  GetToppingsUseCase(this.repository);

  Future<ApiResult<List<OptionEntity>>> call() async {
    return await repository.getToppings();
  }
}