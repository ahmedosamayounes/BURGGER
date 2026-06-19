import '../../../../core/networking/api_result.dart';
import '../entities/option_entity.dart';

abstract class SideOptionsRepository {
  Future<ApiResult<List<OptionEntity>>> getSideOptions();
}