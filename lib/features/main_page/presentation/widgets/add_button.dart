import 'package:flutter/material.dart';

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() =>
      _AddButtonState();
}

class _AddButtonState
    extends State<AddButton> {

  double scale = 1;

  void _onTapDown(
      TapDownDetails details,
      ) {

    setState(() {
      scale = 0.95;
    });
  }

  void _onTapUp(
      TapUpDetails details,
      ) {

    setState(() {
      scale = 1;
    });
  }

  void _onTapCancel() {

    setState(() {
      scale = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTapDown: _onTapDown,

      onTapUp: _onTapUp,

      onTapCancel: _onTapCancel,

      onTap: (){ScaffoldMessenger.of(context).showSnackBar(SnackBar(

        content: Text(

          'Word added',

        )
      ));
      },

      child: AnimatedScale(

        scale: scale,

        duration: const Duration(
          milliseconds: 120,
        ),

        child: Padding(
          padding: const .fromLTRB(
            16,
            0,
            16,
            8,
          ),

          child: Container(
            height: 72,

            decoration: BoxDecoration(
              borderRadius: .circular(24),

              color: Colors.lightGreen,
            ),

            child: const Center(
              child: Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}