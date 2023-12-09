// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:social_media_flutter/social_media_flutter.dart';
import 'package:skeletonizer/skeletonizer.dart';

class UserViewPage extends StatefulWidget {
  //TODO -> tener en cuenta si el usuario no tiene el internet conectado ver que las imagenes que estan cargadas se puedan ver o si no estan que el fondo se vea gris

  const UserViewPage({super.key});

  @override
  State<UserViewPage> createState() => _UserViewPageState();
}

class _UserViewPageState extends State<UserViewPage> {
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        buildTops(),
        contextBody(),
        buildAbout(),
      ]),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 0, right: 4),
        child: FloatingActionButton(
          child: Icon(
            _enabled
                ? Icons.replay_outlined
                : Icons.cached_outlined,
          ),
          onPressed: () {
            setState(() {
              _enabled = !_enabled;
            });
          },
        ),
      ),
    );
  }

  Widget buildTops() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: <Widget>[
        coverImage(),
        profileImage(),
      ],
    );
  }

  Widget coverImage() => Container(
        margin: const EdgeInsets.only(bottom: 144 / 2),
        color: Colors.grey,
        child: SafeArea(
          child: Skeletonizer(
            enabled: _enabled,
            child: Image.network(
              "https://www.contensis.com/image-library/resources-images/image-api-examples/tree-frog.jpg?width=400&height=400&fit=crop",
              width: double.infinity,
              height: 280,
              fit: BoxFit.cover,
            ),
          ),
        ),
      );

  Widget profileImage() => Positioned(
        top: 280 - 144 / 2,
        child: Skeletonizer(
          enabled: _enabled,
          child: CircleAvatar(
            radius: 144 / 2,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(
              "https://randomuser.me/api/portraits/men/75.jpg",
            ),
          ),
        ),
      );

  Widget contextBody() {
    return Skeletonizer(
      enabled: _enabled,
      child: Column(
        children: [
          const SizedBox(height: 8),
          const Text(
            'Usuario Data',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          const Text(
            'Entrenador, Peluquero',
            style: TextStyle(fontSize: 15, color: Colors.blue),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('Misiones', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('5')
                ],
              ),
              Column(
                children: [
                  Text(
                    'Seguidores',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('200')
                ],
              ),
              Column(
                children: [
                  Text('Ranquing', style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('122')
                ],
              ),
            ],
          ),
          const Divider(
            endIndent: 12,
            indent: 12,
          ),
        ],
      ),
    );
  }

  Widget buildAbout() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Skeletonizer(
          enabled: _enabled,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Cuenta creada el 15 de marzo del 2023.',
                style: TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.green,
                    fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Acerca de mi..',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'Lorem Ipsum es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset",',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade200),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                  ),
                  Text('Confiable'),
                  Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade200),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                  ),
                  Text('Confiable'),
                  Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.all(8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green.shade200),
                    child: const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                  ),
                  const Expanded(child: Text('Confiable con tiempo de entrega')),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              infoUserSocial(),
              const Padding(
                padding: EdgeInsets.all(8),
                child: Text(
                  'Mis servicios',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              servicesPet(),
              const SizedBox(
                height: 10,
              ),
              Text(
                'solicitar servicio',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              const SizedBox(
                height: 10,
              ),
              servicesSolicitude(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );

  Widget infoUserSocial() => Container(
        decoration: const BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(5))),
        width: double.infinity,
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            SocialWidget(
              placeholderText: 'User-lo',
              iconData: SocialIconsFlutter.instagram,
              iconColor: Colors.pink,
              link: 'https://www.instagram.com/akshitmadan_/',
              placeholderStyle: TextStyle(color: Colors.black, fontSize: 15),
            ),
            SocialWidget(
              placeholderText: 'iolp-ll', //text visible to viewers
              iconData:
                  SocialIconsFlutter.facebook, //use the respective social logo
              iconColor: Colors.blue.shade900, //(optional, default - grey)
              link:
                  'https://www.instagram.com/akshitmadan_/', //provide the link
              placeholderStyle: const TextStyle(
                  color: Colors.black, fontSize: 15), //placeholder text style
            ),
          ]),
        ),
      );

  Widget servicesPet() => SizedBox(
        height: 150,
        width: double.infinity,
        child: GridView.count(
          scrollDirection: Axis.horizontal,
          crossAxisSpacing: 1,
          mainAxisSpacing: 5,
          crossAxisCount: 1,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.amber,
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Icon(Icons.pets, size: 40),
                  ),
                  Text('Paseador'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('servicio calificado')
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Icon(Icons.cut_rounded, size: 40),
                  ),
                  Expanded(child: Text('Peluquero de animales')),
                  SizedBox(
                    height: 12,
                  ),
                  Text('servicio calificado')
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.blue,
              ),
              child: const Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                    child: Icon(Icons.campaign_sharp, size: 40),
                  ),
                  Text('Cuidador'),
                  SizedBox(
                    height: 12,
                  ),
                  Text('servicio calificado')
                ],
              ),
            ),
          ],
        ),
      );

  Widget servicesSolicitude() => SizedBox(
        height: 50,
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            //TODO -> aqui un usuario podria solicitar un servicio de los que la persona disponga ya que si no tiene nignuno no se podra solicitar un servicio inexistente
          },
          color: Colors.blue.shade300,
          child: Text('Solicitar servicio'),
        ),
      );
}
