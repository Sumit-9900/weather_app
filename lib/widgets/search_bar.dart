import 'package:flutter/material.dart';

class Searchbar extends StatefulWidget {
  const Searchbar({
    super.key,
    required this.onTextChanged,
    required this.onClick,
    required this.color,
  });

  final void Function(String) onTextChanged;
  final void Function() onClick;
  final Color color;

  @override
  State<Searchbar> createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        constraints: const BoxConstraints(
          maxHeight: 55,
        ),
        filled: true,
        // fillColor: const Color.fromARGB(255, 231, 225, 224),
        fillColor: widget.color,
        prefixIcon: const Icon(Icons.search),
        // suffixIcon: IconButton(
        //   onPressed: widget.onClick,
        //   icon: const Icon(
        //     Icons.done,
        //     color: Color.fromARGB(136, 0, 0, 0),
        //     size: 35,
        //   ),
        // ),
        hintText: 'Search',
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      onChanged: (value) {
        widget.onTextChanged(value);
        widget.onClick();
      },
    );
  }
}
