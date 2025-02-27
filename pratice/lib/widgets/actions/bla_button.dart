import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';

//
// BLA-003 - Implement BlaButton
// Create Enum of Primary and Secondary Button
//
enum BlaButtonType { primary, secondary }

//
// This is the class for BlaButton, can you across each screen that is needed
//
class BlaButton extends StatelessWidget {
  // Parameter for BlaButton
  final BlaButtonType type;
  final Icon? icon;
  final String label;
  final VoidCallback onPressedBlaButton;
  const BlaButton(
      {super.key,
      required this.type,
      this.icon,
      required this.label,
      required this.onPressedBlaButton});

  @override
  Widget build(BuildContext context) {
    // declear ButtonStyle for the button
    ButtonStyle buttonStyle;
    // If Condition for the ButtonStyle between Primary and Secondary
    if (type == BlaButtonType.primary) {
      buttonStyle = ElevatedButton.styleFrom(
          backgroundColor: BlaColors.primary, // Button Background Colors
          foregroundColor: BlaColors.backgroundAccent, // Button Text Colors
          iconColor: BlaColors.backgroundAccent, // Button Icon Colors
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
    } else {
      buttonStyle = ElevatedButton.styleFrom(
          backgroundColor:
              BlaColors.backgroundAccent, // Button Background Colors
          foregroundColor: BlaColors.primary, // Button Text Colors
          iconColor: BlaColors.primary, // Button Icon Colors
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)));
    }

    // Widget for displaying the buttonContent, checking if it has a icon or not and label for the button
    Widget buttonContent = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) icon!, // Check if there is a icon or not
        if (icon != null)
          SizedBox(
              width:
                  8), // if there is an icon at sizedbox for spacing between Text and Icon
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        )
      ],
    );

    // Checking to see if the BlaButtonType is primary or secondary Button
    return type == BlaButtonType.primary
        ? ElevatedButton(
            onPressed: onPressedBlaButton,
            style: buttonStyle,
            child: buttonContent)
        : ElevatedButton(
            onPressed: onPressedBlaButton,
            style: buttonStyle,
            child: buttonContent);
  }
}

// For Testing and validating the BlaButton
void main() {
  return runApp(MaterialApp(
    title: 'Bla App',
    home: Scaffold(
        appBar: AppBar(
          title: Text('Bla App'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Testing BlaButton Primary
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlaButton(
                label: 'Request a Book',
                type: BlaButtonType.primary,
                icon: Icon(Icons.calendar_month),
                onPressedBlaButton: () {
                  print('Button with icon clicked!');
                },
              ),
            ),
            // Testing BlaButton Secondary
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlaButton(
                label: 'Contact Us',
                type: BlaButtonType.secondary,
                icon: Icon(
                  Icons.chat,
                ),
                onPressedBlaButton: () {
                  print('Button with icon clicked!');
                },
              ),
            ),
          ],
        )),
  ));
}
