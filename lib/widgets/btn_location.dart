part of 'widgets.dart';

class BtnLocation extends StatelessWidget {
  const BtnLocation({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final mapBloc = context.read<MapsBloc>();
    final myLocationBloc = context.read<MyLocationBloc>();
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 25,
        child: IconButton(
          icon: Icon(Icons.my_location, color: Colors.black87),
          onPressed: () {
            final lnt = myLocationBloc.state.location.latitude;
            final lng = myLocationBloc.state.location.longitude;
            final destination = LatLng(lnt, lng);
            mapBloc.moveCamera(destination);
          },
        ),
      ),
    );
  }
}
