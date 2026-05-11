import 'package:cocoon_admin/features/auth/presentation/ui/dialog_popup.dart';
import 'package:cocoon_admin/features/navigation/presentation/bloc/cubit/navrail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Widget buildItem(BuildContext context, IconData icon, String title, int index) {
  return ListTile(
    leading: Icon(icon),
    title: Text(title),
    onTap: () {
      Navigator.pop(context); // close drawer

      if (index == 5) {
        showLogoutDialog(context);
        return;
      }

      context.read<NavrailCubit>().updateIndex(index);
    },
  );
}