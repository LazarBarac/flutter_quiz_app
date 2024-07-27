import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.color1, this.color2, this.screen, {super.key});

  final Color color1;
  final Color color2;
  final Widget screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [color1, color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: screen,
    );
  }
}



// class GradientContainer extends StatefulWidget {
//   const GradientContainer(this.color1, this.color2, this.screen, {super.key});

//   final Color color1;
//   final Color color2;
//   final Widget screen;

//   @override
//   State<GradientContainer> createState() {
//     return _GradientContainerState();
//   }
// }

// class _GradientContainerState extends State<GradientContainer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [widget.color1, widget.color2],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: widget.screen,
//     );
//   }
// }
