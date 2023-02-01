import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smatch_managment/features/home_business/bloc/home_business_bloc.dart';
import 'package:smatch_managment/features/home_business/pages/home_business_view.dart';
import 'package:smatch_managment/features/home_business/provider/home_business_provider.dart';
import 'package:smatch_managment/features/home_business/repositories/home_business_repository.dart';

class HomeBusinessPage extends StatelessWidget {
  const HomeBusinessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    return BlocProvider(
      create: (context) =>
          HomeBusinessBloc(homeBusinessRepository: HomeBusinessRepository())
            ..add(FetchUserEvent()),
      child: ChangeNotifierProvider(
        create: (_) => HomeBuinessProvider(),
        // lazy: false,
        child: const HomeBusinessView(),
      ),
    );
  }
}
