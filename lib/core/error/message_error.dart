import '../config/app_contants.dart';
import 'failure.dart';

class MessageError {
  static mapErrorMessage(Failure failure) {
    switch (failure.runtimeType) {
      case NetworkFailure:
        return AppConstants.connexionNotFoundMessage;
      case ServerFailure:
        return AppConstants.serverFailureMessage;
      case CacheFailure:
        return AppConstants.cacheFailureMessage;
      case CustomerFailure:
        return (failure as CustomerFailure).message;
      case PermissionDeniedFailure:
        return (failure as PermissionDeniedFailure).message;
    }
  }
}
