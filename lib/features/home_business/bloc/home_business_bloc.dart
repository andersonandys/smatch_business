import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:smatch_managment/core/error/failure.dart';
import 'package:smatch_managment/core/models/business_model.dart';
import 'package:smatch_managment/features/home_business/repositories/home_business_repository.dart';

part 'home_business_event.dart';
part 'home_business_state.dart';

class HomeBusinessBloc extends Bloc<HomeBusinessEvent, HomeBusinessState> {
  final HomeBusinessRepository homeBusinessRepository;

  HomeBusinessBloc({required this.homeBusinessRepository})
      : super(HomeBusinessInitial()) {
    on<HomeBusinessEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is FetchUserEvent) {
        emit(FecthUserLoading());
        final Either<Failure, User> failureOrSuccess =
            await homeBusinessRepository.checkAuth();
        failureOrSuccess.fold(
          (failure) => emit(FecthUserError()),
          (success) => emit(FecthUserLoaded(user: success)),
        );
      } else if (event is FetchBusinessEvent) {
        emit(FecthAllBusinessLoading());
        final Either<Failure, List<BusinessModel>> failureOrSuccess =
            await homeBusinessRepository.getBusiness(userId: event.uid);
        failureOrSuccess.fold(
          (failure) => emit(FecthAllBusinessError()),
          (success) => emit(FecthAllBusinessLoaded(business: success)),
        );
      }
    });
  }
}
