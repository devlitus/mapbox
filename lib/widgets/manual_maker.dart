part of 'widgets.dart';

class ManualMaker extends StatelessWidget {
  const ManualMaker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.manualSelection) {
          return _BuildManualMaker();
        }
        return Container();
      },
    );
  }
}

class _BuildManualMaker extends StatelessWidget {
  const _BuildManualMaker({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Positioned(
          top: 70,
          left: 20,
          child: FadeInLeft(
            child: CircleAvatar(
              maxRadius: 25,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black87,
                ),
                onPressed: () {
                  context.read<SearchBloc>().add(OnRemoveMakerManual());
                },
              ),
            ),
          ),
        ),
        Center(
          child: Transform.translate(
            offset: Offset(0, -15),
            child: BounceInDown(
              child: Icon(
                Icons.location_on,
                size: 40,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 26,
            left: 40,
            child: FadeIn(
              child: MaterialButton(
                minWidth: width - 130,
                child: Text('Confirmar destino',
                    style: TextStyle(color: Colors.white)),
                color: Colors.black,
                shape: StadiumBorder(),
                elevation: 0,
                onPressed: () {
                  // TODO: confirm destination
                },
              ),
            )),
      ],
    );
  }
}
