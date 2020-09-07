/*
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invercapitalapp/src/api/search_api.dart';
import 'package:invercapitalapp/src/bloc/pages/home/bloc.dart';
import 'package:invercapitalapp/src/models/Place.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (_, state) {
        return Container(
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Row(
                    children: <Widget>[
                      Text(
                        "Search place ... ",
                        style: TextStyle(
                          color: Colors.black26,
                        ),
                      ),
                      Icon(Icons.search),
                    ],
                  ),
                  onPressed: () async {
                    final List<Place> history = state.history.values.toList();
                    SearchPlacesDelegate delegate =
                        SearchPlacesDelegate(state.myLocation, history);
                    final Place place = await showSearch<Place>(
                        context: context, delegate: delegate);

                    if (place != null) {
                      bloc.goToPlace(place);
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size(double.infinity, 50);
}

class SearchPlacesDelegate extends SearchDelegate<Place> {
  final List<Place> history;
  final LatLng at;
  final SearchApi api = SearchApi.instance;

  SearchPlacesDelegate(this.at, this.history);

  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          this.query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (this.query.trim().length >= 3) {
      return FutureBuilder<List<Place>>(
        future: api.searchPlace(this.query, this.at),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (_, index) {
                  final Place place = snapshot.data[index];
                  print(place);
                  return ListTile(
                      onTap: () => this.close(context, place),
                      title: Text(
                        place.title,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle:
                          Text(place.vicinity.replaceAll('<br/>', ' - ')));
                });
          } else if (snapshot.hasError) {
            return Center(child: Text('error'));
          }
          return Center(child: CircularProgressIndicator());
        },
      );
    }
    return Text('invalid query');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Place> history = this.history;

    if (this.query.trim().length > 0) {
      final tmp = this.query.toLowerCase();
      history = history.where((element) {
        if (element.title.toLowerCase().contains(tmp)) {
          return true;
        } else if (element.vicinity.toLowerCase().contains(tmp)) {
          return true;
        }

        return false;
      }).toList();
    }
    return ListView.builder(
      itemCount: history.length,
      itemBuilder: (_, index) {
        final Place place = history[index];
        return ListTile(
            leading: Icon(Icons.history),
            onTap: () => this.close(context, place),
            title: Text(
              place.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(place.vicinity.replaceAll('<br/>', ' - ')));
      },
    );
  }
}

*/
