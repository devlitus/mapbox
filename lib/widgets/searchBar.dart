part of 'widgets.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        if (state.manualSelection) {
          return Container();
        }
        return FadeInDown(
          duration: Duration(milliseconds: 300),
          child: buildSearchbar(context),
        );
      },
    );
  }

  Widget buildSearchbar(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: width,
        child: GestureDetector(
          onTap: () async {
            print('Search...');
            final proximity = context.read<MyLocationBloc>().state.location;
            final history = context.read<SearchBloc>().state.history;
            final result = await showSearch(
              context: context,
              delegate: SearchDestination(proximity, history),
            );
            this.returnSearch(context, result);
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            width: double.infinity,
            child: Text(
              'Donde quieres ir ?',
              style: TextStyle(color: Colors.black87),
            ),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset(0, 5))
                ]),
          ),
        ),
      ),
    );
  }

  void returnSearch(BuildContext context, SearchResult result) {
    if (result.cancel) return;
    if (result.manual) {
      context.read<SearchBloc>().add(OnActiveMakerManual());
      return;
    }
    final searchBloc = context.read<SearchBloc>();
    searchBloc.add(OnAddHistory(result));
  }
}
