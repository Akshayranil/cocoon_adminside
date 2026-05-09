 import 'package:cocoon_admin/core/theme/colors.dart';
import 'package:cocoon_admin/features/aminities/presentation/bloc/aminities/aminities_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showAddAmenityDialog(BuildContext context) {
    final nameController = TextEditingController();


    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Add Amenity"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Amenity Name"),
            ),
           
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            
            onPressed: () {
              final name = nameController.text.trim();
            

              if (name.isNotEmpty) {
                context
                    .read<AminitiesBloc>()
                    .add(AddAminitiesEvent(name));
                Navigator.pop(context);
              }
            },
            style: ElevatedButton.styleFrom(backgroundColor:AppColor.primary,foregroundColor: AppColor.ternary ),
            child: const Text("Add"),
          ),
          
        ],
      ),
    );
  }