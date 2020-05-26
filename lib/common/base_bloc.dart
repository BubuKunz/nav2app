import 'package:alt_bloc/alt_bloc.dart';
import './common_router.dart';
import '../data/network/network_errors.dart';

class BaseBloc extends Bloc with _CommonErrorsHandler {

  BaseBloc() {
    registerState<bool>(initialState: false);
  }

  void showProgress() => addState<bool>(true);

  void hideProgress() => addState<bool>(false);
}

mixin _CommonErrorsHandler on Bloc {

  void handleError(Error error) {
    if (error is ConnectionError) {
      addNavigation(routeName: ErrorsRouter.connectionErrorRoute);
    } else {
      addNavigation(routeName: ErrorsRouter.unexpectedErrorRoute);
    }
  }
}