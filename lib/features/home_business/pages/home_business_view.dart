library dashboard;


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:smatch_managment/core/provider/app_provider.dart';
import 'package:smatch_managment/features/home_business/bloc/home_business_bloc.dart';
import 'package:smatch_managment/features/home_business/provider/home_business_provider.dart';
import 'package:smatch_managment/features/home_business/widgets/drawer_content.dart';
import 'package:http/http.dart' as http;
import '../../login/app_styles.dart';

class HomeBusinessView extends StatefulWidget {
  const HomeBusinessView({super.key});

  @override
  State<HomeBusinessView> createState() => _HomeBusinessViewState();
}

class _HomeBusinessViewState extends State<HomeBusinessView> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeBuinessProvider homeBusinessProvider =
        context.watch<HomeBuinessProvider>();
    final AppProvider appProvider = AppProvider();
    final HomeBusinessBloc homeBusinessBloc = context.watch<HomeBusinessBloc>();

    return BlocConsumer<HomeBusinessBloc, HomeBusinessState>(
        listener: (_, state) async {
      if (state is FecthUserLoaded) {
        appProvider.populateUserData(state.user);
        homeBusinessBloc.add(FetchBusinessEvent(uid: state.user.uid));
      } else if (state is FecthUserError) {
        debugPrint("FecthUserError");
      } else if (state is FecthAllBusinessLoaded) {
        homeBusinessProvider.business = state.business;
      }
    }, builder: (_, state) {
      if (state is FecthUserError || state is FecthAllBusinessError) {
        return Scaffold(
            body: Center(
          child: SizedBox(
            width: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text("UNE ERREURE EST SURVENUE"),
              ],
            ),
          ),
        ));
      } else if (state is FecthAllBusinessLoaded) {
        if (state.business.isEmpty) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Vous n'avais pas de compte business"),
                    const Text("Cliquer ici pour en créer un"),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {
                          context.go('/register');
                        },
                        borderRadius: BorderRadius.circular(5.0),
                        child: Ink(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 70.0, vertical: 18.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Text(
                              "Créer un compte",
                              style: ralewayStyle.copyWith(
                                fontWeight: FontWeight.w700,
                                color: Colors.green,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Scaffold(
            key: homeBusinessProvider.scaffoldKey,
            backgroundColor: const Color.fromRGBO(31, 31, 31, 1),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerWidget(
                  homeProvider: homeBusinessProvider,
                  pageController: _pageController,
                ),
                Text(
                  homeBusinessProvider.currenteBusiness.id!,
                  style: const TextStyle(color: Colors.red),
                ),
                // if (homeBusinessProvider.currenteBusiness.urlPicture != null)
                //   FutureBuilder<Uint8List>(
                //     future: imageFromUrl(
                //         homeBusinessProvider.currenteBusiness.urlPicture!),
                //     builder: (context, snapshot) {
                //       if (snapshot.hasData) {
                //         return Image.memory(
                //           snapshot.data!,
                //           fit: BoxFit.cover,
                //         );
                //       } else if (snapshot.hasError) {
                //         return Text("${snapshot.error}");
                //       }
                //       return CircularProgressIndicator();
                //     },
                //   )
              ],
            ),
          );
        }
      } else {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  Future<Uint8List> imageFromUrl(String url) async {
    final response = await http.get(Uri.parse(url));
    final responseBytes = response.bodyBytes;
    return responseBytes;
  }
}
