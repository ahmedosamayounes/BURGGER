import '../../../../core/networking/api_result.dart';
import '../entities/option_entity.dart';

abstract class ToppingsRepository {
  Future<ApiResult<List<OptionEntity>>> getToppings();
}