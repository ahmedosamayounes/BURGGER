import '../../domain/entities/option_entity.dart';
import '../../domain/repositories/toppings_repository.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';

class ToppingsRepoImpl implements ToppingsRepository {
  final WebService webService;
  ToppingsRepoImpl(this.webService);

  @override
  Future<ApiResult<List<OptionEntity>>> getToppings() async {
    try {
      final response = await webService.getToppings();
      final toppingsList =
          response.data
              ?.map(
                (optionData) => OptionEntity(
                  id: optionData.id ?? 0,
                  name: optionData.name ?? '',
                  image: optionData.image ?? '',
                ),
              )
              .toList() ??
          [];
      return ApiResult.success(toppingsList);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
