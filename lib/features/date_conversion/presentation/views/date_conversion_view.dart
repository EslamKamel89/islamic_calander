import 'package:flutter/material.dart';
import 'package:islamic_calander/core/widgets/default_drawer.dart';
import 'package:islamic_calander/core/widgets/sizer.dart';
import 'package:islamic_calander/features/date_conversion/presentation/views/widgets/table_widget.dart';
import 'package:islamic_calander/features/date_conversion/presentation/views/widgets/wisdom_coursel.dart';
import 'package:islamic_calander/features/date_conversion/presentation/views/widgets/year_search_widget.dart';
import 'package:islamic_calander/utils/styles/styles.dart';

class DateConversionView extends StatefulWidget {
  const DateConversionView({super.key});
  @override
  State<DateConversionView> createState() => _DateConversionViewState();
}

class _DateConversionViewState extends State<DateConversionView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: txt('Islamic Calendar', e: St.bold20)),
      resizeToAvoidBottomInset: false,
      drawer: const DefaultDrawer(),
      body: Column(
        children: [
          const Sizer(),
          const YearSearchWidget(),
          const TableWidget(),
          // const DataSelector(),
          const Spacer(),
          WisdomCarousel(),
          const Spacer(),
        ],
      ),
    );
  }
}
