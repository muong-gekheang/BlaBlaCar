import 'package:blabla/screens/widget/bla_button.dart';
import 'package:blabla/screens/ride_pref/widgets/circle_icon_button.dart';
import 'package:blabla/theme/theme.dart';
import 'package:flutter/material.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  int selectedSeat = 1;

  void onDecrease() {
    setState(() {
      if (selectedSeat > 1) {
        selectedSeat -= 1;
      }
    });
  }

  void onIncrease() {
    setState(() {
      selectedSeat += 1;
    });
  }

  void onConfirm() {
    Navigator.pop(context, selectedSeat);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close, color: BlaColors.primary, size: 32),
              ),
              Expanded(
                
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'Number of seats to book',
                        style: BlaTextStyles.heading.copyWith(
                          color: BlaColors.neutralDark,
                        ),
                      ),
                    ),
                    SizedBox(height: 300),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleIconButton(icon: Icons.remove, onPressed: onDecrease),
                        Text('${selectedSeat}', style: BlaTextStyles.heading.copyWith(color: BlaColors.neutralDark, fontWeight: FontWeight.bold)),
                        CircleIconButton(icon: Icons.add, onPressed: onIncrease, color: BlaColors.primary,),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 100),
              Container(
                alignment: Alignment.centerRight,
                child: CircleIconButton(icon: Icons.arrow_forward_ios, onPressed: onConfirm, color: BlaColors.primary,))
            ],
          ),
        ),
      ),
    );
  }
}
