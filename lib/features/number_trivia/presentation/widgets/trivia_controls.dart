part of 'widgets.dart';

class TriviaControls extends StatefulWidget {
  const TriviaControls({
    Key key,
  }) : super(key: key);

  @override
  _TriviaControlsState createState() => _TriviaControlsState();
}

class _TriviaControlsState extends State<TriviaControls> {
  final controller = TextEditingController();
  String inputStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //TextField
        TextField(
          decoration: InputDecoration(
              border: OutlineInputBorder(), hintText: 'Input a Number'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            inputStr = value;
          },
          onSubmitted: (_) {
            dispatchConcrete();
          },
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
                child: ElevatedButton(
              onPressed: dispatchConcrete,
              child: Text('Search'),
            )),
            SizedBox(width: 10),
            Expanded(
                child: ElevatedButton(
              onPressed: dispatchRandom,
              child: Text('Search'),
            )),
          ],
        )
      ],
    );
  }

  void dispatchConcrete() {
    //! In New versions of bloc, instead of dispatch, is Add.
    controller.clear();
    FocusScope.of(context).unfocus();
    final numberTriviaBloc = BlocProvider.of<NumberTriviaBloc>(context);
    numberTriviaBloc.dispatch(GetTriviaForConcreteNumber(inputStr));
  }

  void dispatchRandom() {
    //! In New versions of bloc, instead of dispatch, is Add.
    controller.clear();
    FocusScope.of(context).unfocus();
    final numberTriviaBloc = BlocProvider.of<NumberTriviaBloc>(context);
    numberTriviaBloc.dispatch(GetTriviaForRandomNumber());
  }
}
