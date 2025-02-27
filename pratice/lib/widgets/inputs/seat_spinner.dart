// seat_picker.dart
import 'package:flutter/material.dart';
import 'package:week_3_blabla_project/theme/theme.dart';
import 'package:week_3_blabla_project/utils/animations_util.dart';
import 'package:week_3_blabla_project/widgets/actions/bla_button.dart';

class SeatPicker extends StatefulWidget {
  // Initial seat count from parent
  final int initialSeats;

  //Callback to notify parent of seat updates
  final ValueChanged<int> onSeatsChanged;

  const SeatPicker({
    super.key,
    required this.initialSeats,
    required this.onSeatsChanged,
  });

  //
  //Launches the seat picker as a modal dialog
  //
  static Future<void> show({
    required BuildContext context,
    required int initialSeats,
    required ValueChanged<int> onSeatsChanged,
  }) {
    return Navigator.push(
      context,
      //Uses AnimationUtils.createBottomToTopRoute for slide-up animation.
      AnimationUtils.createBottomToTopRoute(
        SeatPicker(
          //Passes parameters to initialize the picker
          initialSeats: initialSeats,
          onSeatsChanged: onSeatsChanged,
        ),
      ),
    );
  }

  @override
  State<SeatPicker> createState() => _SeatPickerState();
}

class _SeatPickerState extends State<SeatPicker> {
  late int _currentSeats;

  @override
  void initState() {
    super.initState();
    _currentSeats = widget.initialSeats;
  }

  // Method for updating the seats
  void _updateSeats(int newValue) {
    setState(() => _currentSeats = newValue);
    widget.onSeatsChanged(newValue);
  }

  //Builds the dialog structure
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Select Passengers"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            _buildSeatControls(),
            const SizedBox(height: 24),
            BlaButton(
              type: BlaButtonType.primary,
              label: "Confirm",
              onPressedBlaButton: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }

  // Implements seat increment/decrement UI
  Widget _buildSeatControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Decrement Button: Disabled at 1 seat
        IconButton(
          icon: Icon(Icons.remove_circle_outline,
              size: 36, color: BlaColors.primary),
          onPressed:
              _currentSeats > 1 ? () => _updateSeats(_currentSeats - 1) : null,
        ),
        Text('$_currentSeats', style: BlaTextStyles.heading),
        //Increment Button: Disabled at 4 seats
        IconButton(
          icon: Icon(Icons.add_circle_outline,
              size: 36, color: BlaColors.primary),
          onPressed:
              _currentSeats < 4 ? () => _updateSeats(_currentSeats + 1) : null,
        ),
      ],
    );
  }
}
