part of 'home_business_bloc.dart';

@immutable
abstract class HomeBusinessState extends Equatable {}

class HomeBusinessInitial extends HomeBusinessState {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class FecthUserLoading extends HomeBusinessState {
  @override
  List<Object?> get props => [];
}

class FecthUserLoaded extends HomeBusinessState {
  final User user;

  FecthUserLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class FecthUserError extends HomeBusinessState {
  @override
  List<Object?> get props => [];
}

class FecthBusinessLoading extends HomeBusinessState {
  @override
  List<Object?> get props => [];
}

class FecthBusinessLoaded extends HomeBusinessState {
  final BusinessModel business;

  FecthBusinessLoaded({required this.business});

  @override
  List<Object?> get props => [];
}

class FecthBusinessError extends HomeBusinessState {
  @override
  List<Object?> get props => [];
}

class FecthAllBusinessLoading extends HomeBusinessState {
  @override
  List<Object?> get props => [];
}

class FecthAllBusinessLoaded extends HomeBusinessState {
  final List<BusinessModel> business;

  FecthAllBusinessLoaded({required this.business});

  @override
  List<Object?> get props => [business];
}

class FecthAllBusinessError extends HomeBusinessState {
  @override
  List<Object?> get props => [];
}
