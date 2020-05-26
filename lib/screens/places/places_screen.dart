import 'package:alt_bloc/alt_bloc.dart';
import 'package:flutter/material.dart';
import 'package:nav2up/data/repository/places_repository.dart';
import 'package:nav2up/screens/places/places_bloc.dart';
import 'package:nav2up/screens/places/places_layout.dart';

class PlacesScreen {

    static const routeName = '/places';

    static WidgetBuilder builder(PlacesRepository contRepository) => (context) {
        return BlocProvider<PlacesBloc>(
            child: PlacesLayout(),
            create: () => PlacesBloc(contRepository),
        router: ContactsRouter().onRoute,
        );
    };

}