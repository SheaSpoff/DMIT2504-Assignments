import 'package:flutter/material.dart';

class DestinationCard extends StatefulWidget {
  final String destination; // Change the type of destination to String
  final Function(bool) onSwipe;

  const DestinationCard({Key? key, required this.destination, required this.onSwipe}) : super(key: key);

  @override
  _DestinationCardState createState() => _DestinationCardState();
}

class _DestinationCardState extends State<DestinationCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _slideAnimation;
  double _dragStartX = 0.0;
  bool _isDragging = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    _slideAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onSwipe(_dragStartX > 0);
        _resetCard();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _resetCard() {
    _controller.reset();
    _dragStartX = 0.0;
    _isDragging = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _isDragging = true;
        _dragStartX = details.localPosition.dx;
      },
      onHorizontalDragUpdate: (details) {
        if (_isDragging) {
          double dx = details.localPosition.dx;
          if (dx > 0) {
            _controller.value = (dx - _dragStartX) / (MediaQuery.of(context).size.width / 2);
          } else {
            _controller.value = (dx - _dragStartX) / (MediaQuery.of(context).size.width / 2);
          }
        }
      },
      onHorizontalDragEnd: (details) {
        if (_isDragging) {
          _controller.forward();
        }
      },
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform(
            transform: Matrix4.rotationZ(_controller.value * 0.2),
            alignment: Alignment.center,
            child: Transform.translate(
              offset: Offset(_slideAnimation.value * 200, 0.0),
              child: Container(
                height: 200.0,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey[200],
                ),
                child: Center(
                  child: Text(
                    widget.destination, 
                    style: TextStyle(fontSize: 24.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

