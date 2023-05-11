import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlidesInfo {
  final String title;
  final String caption;
  final String? imageUrl;

  SlidesInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlidesInfo>[
  SlidesInfo(
      'Misión',
      'Generar impacto y transformar el negocio de nuestros clientes a traves de la innovación tecnologica.',
      'src/assets/images/logo-itti.png'),
  SlidesInfo(
      'Visión',
      'Soñamos con ser líderes en innovación tecnológica con alcance global, brindando soluciones de clase mundial que generen un verdadero impacto en el negocio de nuestros clientes.',
      'src/assets/images/logo-itti.png'),
  SlidesInfo(
      'Nuestra historia',
      'Iniciamos nuestras operaciones en el 2004, con el desarrollo de tecnología enfocados en el sector financiero a través de nuestro CORE bancario ITGF. ITGF es una solución completa de software orientada a entidades financieras tanto reguladas como no reguladas en el Paraguay y con el tiempo pasó a ser el software más utilizado en el mercado.',
      'src/assets/images/logo-itti.png')
];

class OnboardingView extends StatefulWidget {
  static const name = '/onboarding-view';

  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController pageViewController = PageController();

  bool endReached = false;

  @override
  void initState() {
    super.initState();

    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((slideData) => _Slide(
                      title: slideData.title,
                      caption: slideData.caption,
                      imageUrl: slideData.imageUrl!,
                    ))
                .toList(),
          ),
          Positioned(
              right: 20,
              top: 50,
              child: TextButton(
                child: const Text('Skip'),
                onPressed: () => context.push('/login-view'),
              )),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Comenzar'),
                      onPressed: () => context.pushReplacement('/login-view'),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.displayLarge;
    final captionStyle = Theme.of(context).textTheme.headlineSmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              width: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/logo-itti.png'),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 20),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
