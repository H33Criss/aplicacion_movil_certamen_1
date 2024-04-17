import 'package:flutter/material.dart';

class UsmFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Widget? suffixWidget;
  final TextInputType? type;
  final bool? obscureText;
  const UsmFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.type,
    this.suffixWidget,
    //Valor por defecto
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: colors.surfaceVariant,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              //El simbolo "!", indica que siempre habra un valor
              obscureText: obscureText!,
              keyboardType: type,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                hintText: label,
                // filled: true,
                // fillColor: colors.surfaceVariant,
                prefixIcon: Icon(prefixIcon),
                suffixIcon: Icon(suffixIcon),
                // prefixIcon: prefixWidget != null ? Icon(prefixIcon) : null,
                // suffixIcon: suffixWidget != null ? Icon(suffixIcon) : null,
              ),
            ),
          ),
          suffixWidget == null ? Container() : suffixWidget!,
        ],
      ),
    );
  }
}
