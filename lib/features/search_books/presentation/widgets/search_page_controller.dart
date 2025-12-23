import 'package:books/features/search_books/presentation/bloc/book_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchPageController extends StatefulWidget {
  const SearchPageController({super.key});

  @override
  SearchPageControllerState createState() => SearchPageControllerState();
}

class SearchPageControllerState extends State<SearchPageController> {
  final controller = TextEditingController();
  String inputString = "";

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: _getFlexDirection(),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width:200,
              child: TextField(
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(
                  hintText: 'ISBN',
                ),
                onChanged: (value) {
                  inputString = value;
                },
                onSubmitted: (_) {
                  _dispatchGetByIsbn();
                },
              ),
            ),
            TextButton(
              onPressed: _dispatchGetByIsbn,
              child: const Text("Voir ce livre"),
            )
          ],
        ),
        const SizedBox(
          height: 25,
          width: 50,
        ),
        TextButton(
          onPressed: _dispatchGetRandom,
          child: const Text("Voir un livre au hasard"),
        ),
      ],
    );
  }

  void _dispatchGetByIsbn() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    context.read<BookBloc>().add(GetBookByIsbnEvent(inputString));
  }

  void _dispatchGetRandom() {
    context.read<BookBloc>().add(const GetRandomBookEvent());
  }

  Axis _getFlexDirection() {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape ? Axis.horizontal : Axis.vertical;
  }
}
