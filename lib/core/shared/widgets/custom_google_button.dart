import 'package:flutter/material.dart';

class CustomGoogleButton extends StatelessWidget {
  final void Function()? onTap;
  final String buttonText;
  const CustomGoogleButton({
    Key? key,
    this.onTap,
    this.buttonText = "Continue with Google",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return InkWell(
      onTap: onTap,
      child: Material(
        borderRadius: BorderRadius.circular(9),
        child: Container(
          height: 57,
          alignment: Alignment.center,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: [boxShadow(context)],
            color: getColor(context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 10),
              Image.asset(
                "assets/images/google_logo.png",
                height: 29,
                width: 29,
              ),
              const SizedBox(width: 30),
              Text(buttonText, style: textTheme.bodyText2),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  Color getColor(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return Colors.grey[900]!;
    }
    return Colors.white;
  }

  BoxShadow boxShadow(BuildContext context) {
    if (Theme.of(context).brightness == Brightness.dark) {
      return BoxShadow(
        color: Colors.grey[900]!,
        offset: const Offset(0, 2),
        blurRadius: 72,
      );
    }
    return const BoxShadow(
      color: Color.fromRGBO(185, 182, 182, 0.2800000011920929),
      offset: Offset(0, 2),
      blurRadius: 72,
    );
  }
}
