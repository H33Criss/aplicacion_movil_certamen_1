import 'package:flutter/material.dart';

class UsmFormField extends StatelessWidget {
  final String label;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextInputType? type;
  final bool? obscureText;
  const UsmFormField({
    super.key,
    required this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.type,
    //Valor por defecto
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return TextFormField(
      //El simbolo "!", indica que siempre habra un valor
      obscureText: obscureText!,
      keyboardType: type,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide.none,
        ),
        hintText: label,
        filled: true,
        fillColor: colors.surfaceVariant,
        prefixIcon: Icon(prefixIcon),
        suffixIcon: Icon(suffixIcon),
      ),
    );
  }
}
