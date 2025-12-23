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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(width:200, child: TextField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: const InputDecoration(
            hintText: 'ISBN',
          ),
          onChanged: (value) {
            inputString = value;
          },
          onSubmitted: (_) {
            dispatchGetByIsbn();
          },
        )),
        const SizedBox(width: 20),
        TextButton(
          onPressed: dispatchGetByIsbn,
          child: const Text("Voir ce livre"),
        ),
        const SizedBox(width: 50),
        TextButton(
          onPressed: dispatchGetRandom,
          child: const Text("Voir un livre au hasard"),
        ),
      ],
    );
  }

  void dispatchGetByIsbn() {
    // Clearing the TextField to prepare it for the next inputted number
    controller.clear();
    context.read<BookBloc>().add(GetBookByIsbnEvent(inputString));
  }

  void dispatchGetRandom() {
    context.read<BookBloc>().add(const GetRandomBookEvent());
  }
}
