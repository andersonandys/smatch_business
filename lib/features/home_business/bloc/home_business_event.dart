part of 'home_business_bloc.dart';

@immutable
abstract class HomeBusinessEvent extends Equatable {}

class FetchBusinessEvent extends HomeBusinessEvent {
  final String uid;

  FetchBusinessEvent({required this.uid});

  @override
  List<Object?> get props => [uid];
}

class PopulateDataEvent extends HomeBusinessEvent {
  final User user;
  PopulateDataEvent({
    required this.user,
  });
  @override
  List<Object?> get props => [user];
}

class FetchUserEvent extends HomeBusinessEvent {
  @override
  List<Object?> get props => [];
}

// class SaveHelperMeEvent extends HomeEvent {
//   @override
//   List<Object?> get props => [];
// }
