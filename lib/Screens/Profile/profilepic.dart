import 'package:flutter/material.dart';

class Pofile extends StatelessWidget {
  const Pofile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 150,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
            
          ),
          Positioned(
            right: 100,
            bottom: 0,
            child: SizedBox(
              child: FlatButton(
                onPressed: () {},
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
