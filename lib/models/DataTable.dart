import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:access_control_residential/Provider/riverpod.dart';

class MyDataTable extends ConsumerWidget {
  const MyDataTable({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apiData = ref.watch(apiDataProvider);

    return apiData.when(
      data: (registerList) {
        return DataTable(
          columns: const [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Date')),
            DataColumn(label: Text('Time')),
            DataColumn(label: Text('UserID')),
            DataColumn(label: Text('VehicleID')),
            DataColumn(label: Text('Status')),
          ],
          rows: registerList.map((register) {
            return DataRow(cells: [
              DataCell(Text(register.id.toString())),
              DataCell(Text(register.date)),
              DataCell(Text(register.time)),
              DataCell(Text(register.idUser.toString())),
              DataCell(Text(register.idVehicle.toString())),
              DataCell(Text(register.status.toString())),
            ]);
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (error, stack) => Text('Error: $error'),
    );
  }
}