import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_indicator/ui/screens/screens.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  //Controlador para hacer seguimiento a las paginas
  PageController _pageController = PageController();
  //Controlador para realizar seguimiento si estamos en la última pagina
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 2);
              });
            },
            children: [
              OnBoarding(color: Colors.white, texto: 'Podrás utilizar una variedad de herramientas.', child: Image.asset('assets/onBoarding0.png', height: 300, width: 300.0)),
              OnBoarding(color: Colors.yellowAccent, texto:'Haz todas las notas que creas necesarias.', child: Image.asset('assets/onBoarding1.png', height: 300, width: 300.0)),
              OnBoarding(color: Colors.green,texto: 'Desarrolla proyectos de una forma ordenada y junto a tus compañeros.', child: Image.asset('assets/onBoarding2.png', height: 300, width: 300.0)),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _pageController.jumpToPage(2);
                  },
                  child: const Text('Omitir')
                ),

                SmoothPageIndicator(
                  controller: _pageController, 
                  count: 3,
                  effect: const SlideEffect(
                    dotColor: Colors.grey,
                    dotHeight: 15,
                    activeDotColor: Colors.black,
                    dotWidth: 30
                  ),
                ),
                onLastPage ? GestureDetector(
                  onTap: () {
                   context.push('/login');
                  },
                  child: const Text('Hecho', style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                ) : GestureDetector(
                  onTap: () {
                  _pageController.nextPage(
                    duration: const Duration(microseconds: 500), 
                    curve: Curves.easeIn);
                  },
                  child: const Icon(
                    Icons.keyboard_arrow_right, 
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}