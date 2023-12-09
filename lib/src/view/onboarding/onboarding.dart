import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pet_other_palace/src/controller/controller.dart';

class OnboardWidget extends StatelessWidget {
  const OnboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final heigthScreen = mediaQuery.height;
    final withScreen = mediaQuery.width;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          //actions: [TextButton(onPressed: () {}, child: const Text('SKIP'))]),
        ),
        body: PageView.builder(
          itemCount: 2,
          itemBuilder: (_, index) {
            final data = lisOnboarding[index];
            return Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                    height: heigthScreen * 0.25,
                    child: SvgPicture.asset(data.pathImage)),
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: SizedBox(
                    height: heigthScreen * 0.2,
                    width: 300,
                   // color: Colors.amber,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Text(
                            data.title,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 3, bottom: 3),
                          child: Text(
                            data.subtitle,
                            style: const TextStyle(fontSize: 15),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(data.bodyData, style: const TextStyle(fontSize: 15)),
                        ),
                      ],
                    ),
                  ),
                ),
                  
                //TODO -< Show only end page
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text('buttom'),
                  ),
                )
              ],
            );
          },
        ));
  }
}
