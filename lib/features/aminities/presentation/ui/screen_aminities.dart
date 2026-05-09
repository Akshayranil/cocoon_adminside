import 'package:cocoon_admin/core/theme/colors.dart';
import 'package:cocoon_admin/features/aminities/presentation/bloc/aminities/aminities_bloc.dart';
import 'package:cocoon_admin/features/aminities/presentation/widgets/show_modal_aminity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenAminities extends StatelessWidget {
  const ScreenAminities({super.key});

  @override
  Widget build(BuildContext context) {
    // Trigger initial load
    context.read<AminitiesBloc>().add(AminitiesLoadedEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Manage Amenities",),centerTitle: true,
      ),
      body: BlocBuilder<AminitiesBloc, AminitiesState>(
        builder: (context, state) {
          if (state is AminitiesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is AminitiesLoadedState) {
            final amenities = state.aminities;
            if (amenities.isEmpty) {
              return const Center(child: Text("No amenities added yet."));
            }
            return ListView.builder(
              itemCount: amenities.length,
              itemBuilder: (context, index) {
                final amenity = amenities[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: amenity.icon != null
                        ? Image.network(amenity.icon!)
                        : const Icon(Icons.miscellaneous_services),
                    title: Text(amenity.name),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: AppColor.warning),
                      onPressed: () {
                        context
                            .read<AminitiesBloc>()
                            .add(DeleteAminitiesEvent(amenity.id));
                      },
                    ),
                  ),
                );
              },
            );
          } else if (state is AminitiesErrorState) {
            return Center(child: Text("Error: ${state.error}"));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(backgroundColor: AppColor.primary,foregroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () => showAddAmenityDialog(context),
      ),
      
    );
  }

 
}
