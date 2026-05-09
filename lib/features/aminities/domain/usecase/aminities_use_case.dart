import 'package:cocoon_admin/features/aminities/domain/entity/aminities_entity.dart';
import 'package:cocoon_admin/features/aminities/domain/repository/aminities_repositories.dart';

class GetAllAminitiesUseCase {
  final AminitiesRepositories aminitiesRepositories;

  GetAllAminitiesUseCase(this.aminitiesRepositories);

  Future<List<AminitiesEntity>> call() async {
    final aminities = await aminitiesRepositories.getAllAminities();
    return aminities;
  }
}

class AddAminitiesUseCase {
  final AminitiesRepositories aminitiesRepositories;

  AddAminitiesUseCase(this.aminitiesRepositories);

  Future<void> call(String name) async {
    return aminitiesRepositories.addSpecificAminities(name);
  }
}

class DeleteAminitiesUseCase {
  final AminitiesRepositories aminitiesRepositories;

  DeleteAminitiesUseCase(this.aminitiesRepositories);

  Future<void> call(id) {
    return aminitiesRepositories.deleteSpecificAminities(id);
  }
}
