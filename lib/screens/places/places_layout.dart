import 'package:alt_bloc/alt_bloc.dart';
import 'package:flutter/material.dart';

import '../../data/model/place.dart';
import '../places/places_bloc.dart';

class PlacesLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Places'),
        ),
        body: Stack(
          children: <Widget>[
            BlocBuilder<PlacesBloc, List<Place>>(
              builder: (_, places) {
                return RefreshIndicator(
                    onRefresh: () => Provider.of<PlacesBloc>(context).getPlaces(),
                    child: ListView.separated(
                      itemBuilder: (_, index) {
                        final place = places[index];
                        return GestureDetector(
                          onTap: () {
                            // todo need to be implemented
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    place.name,
                                    style: Theme.of(context).textTheme.display2,
                                  ),
                                ),
                                SizedBox(
                                  width: 8.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, __) => Divider(),
                      itemCount: places.length,
                    ));
              },
            ),
            BlocBuilder<PlacesBloc, bool>(
              builder: (_, progress) {
                return progress
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Container();
              },
            )
          ],
        ));
  }
}
