import '../../domain/entities/option_entity.dart';
import '../../domain/repositories/side_options_repository.dart';

import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/networking/api_result.dart';
import '../../../../core/networking/web_service.dart';

class SideOptionsRepoImpl implements SideOptionsRepository {
  final WebService webService;
  SideOptionsRepoImpl(this.webService);

 @override
  Future<ApiResult<List<OptionEntity>>> getSideOptions() async {
    try {
      final response = await webService.getSideOptions();
      final sidesList = response.data
              ?.map((optionData) => OptionEntity(
                    id: optionData.id ?? 0,
                    name: optionData.name ?? '',
                    image: optionData.image ?? '',
                  ))
              .toList() ??
          [];
      return ApiResult.success(sidesList);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}