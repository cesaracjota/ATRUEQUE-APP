import 'package:atrueque/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ImageInfo {
  final String imagePath;
  final String title;
  final String subtitle;

  ImageInfo({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}

class IndexPage extends StatelessWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ImageInfo> imagesInfo = [
      ImageInfo(
        imagePath: 'assets/images/image1.png',
        title: 'Cuidemos al Medio Ambiente',
        subtitle: 'Subtítulo de la Imagen 1',
      ),
      ImageInfo(
        imagePath: 'assets/images/image2.png',
        title: 'Título de la Imagen 2',
        subtitle: 'Subtítulo de la Imagen 2',
      ),
      ImageInfo(
        imagePath: 'assets/images/image3.png',
        title: 'Título de la Imagen 3',
        subtitle: 'Subtítulo de la Imagen 3',
      ),
      ImageInfo(
        imagePath: 'assets/images/image4.png',
        title: 'Título de la Imagen 4',
        subtitle: 'Subtítulo de la Imagen 4',
      ),
      ImageInfo(
        imagePath: 'assets/images/image5.png',
        title: 'Título de la Imagen 5',
        subtitle: 'Subtítulo de la Imagen 5',
      ),
    ];

    return Scaffold(
      backgroundColor: terciaryColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.logo_dev,
          size: 40,
        ),
        title: const Text.rich(
          TextSpan(
            text: 'BIENVENIDO(A) ',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.normal,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'A',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: secondaryColor,
                ),
              ),
              TextSpan(
                text: 'TRUEQUE',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1000),
                  viewportFraction: 0.8,
                  initialPage: 0,
                ),
                items: imagesInfo.map((ImageInfo imageInfo) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              imageInfo.imagePath,
                              fit: BoxFit.fitHeight,
                              height: MediaQuery.of(context).size.height * 0.30,
                            ),
                            Container(
                              padding: const EdgeInsets.all(16),
                              alignment: Alignment.center,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    imageInfo.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w900,
                                      // color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    imageInfo.subtitle,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      // color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/login');
                  },
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        side: const BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  style: ButtonStyle(
                    padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                    backgroundColor: MaterialStateProperty.all(primaryColor),
                    elevation: const MaterialStatePropertyAll(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, '/select-categories');
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                        const EdgeInsets.symmetric(vertical: 15)),
                    // backgroundColor: MaterialStateProperty.all(terciaryColor),
                    elevation: MaterialStateProperty.all(0),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        // side: BorderSide(color: Colors.grey[300]!),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Iniciar Sesión como Invitado',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    text: 'Al continuar, usted acepta nuestra ',
                    style: const TextStyle(
                      fontSize: 14,
                      color: blackColor,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Política de Privacidad',
                        style: const TextStyle(
                          color: secondaryColor,
                          fontSize: 14,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, '/terms');
                          },
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
