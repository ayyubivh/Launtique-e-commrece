import 'package:e_shoppie/providers/admin/admin_provider.dart';
import 'package:e_shoppie/views/admin/shimmer/analytics_scrn_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/sales.dart';
import '../widgets/category_prdts_charts.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AdminProvider>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.getEarnings(context);
    });

    return provider.earnings == null || provider.totalSales == null
        ? const AnalyticsShimmer()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '\$${provider.totalSales}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: CategoryProductsChart(seriesList: [
                    charts.Series(
                      id: 'Sales',
                      data: provider.earnings!,
                      domainFn: (Sales sales, _) => sales.label,
                      measureFn: (Sales sales, _) => sales.earning,
                    ),
                  ]),
                )
              ],
            ),
          );
  }
}
