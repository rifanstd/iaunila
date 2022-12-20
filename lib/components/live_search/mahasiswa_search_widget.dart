import 'package:flutter/material.dart';

class MahasiswaSearchWidget extends StatefulWidget {
  final String query;
  final String hintText;
  final ValueChanged<String> onChanged;

  const MahasiswaSearchWidget(
      {Key? key,
      required this.query,
      required this.hintText,
      required this.onChanged})
      : super(key: key);

  @override
  State<MahasiswaSearchWidget> createState() => _MahasiswaSearchWidgetState();
}

class _MahasiswaSearchWidgetState extends State<MahasiswaSearchWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const styleIsActive = TextStyle(color: Colors.black);
    const styleHint = TextStyle(color: Colors.black54);
    final style = widget.query.isEmpty ? styleHint : styleIsActive;

    return Container(
      height: 42,
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        border: Border.all(color: Colors.black26),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: style.color),
          suffixIcon: widget.query.isNotEmpty
              ? GestureDetector(
                  child: Icon(Icons.close, color: style.color),
                  onTap: () {
                    controller.clear();
                    widget.onChanged('');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                )
              : null,
          hintText: widget.hintText,
          hintStyle: style,
          border: InputBorder.none,
        ),
        style: style,
        onChanged: widget.onChanged,
      ),
    );
  }
}
