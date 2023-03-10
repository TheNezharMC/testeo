import 'package:flutter/material.dart';

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
   return HomePageState();
  }

}
//Página principal
class HomePageState extends State<HomePage>{
  Icon navBarIcon = const Icon(Icons.search);
  Widget searchBar = const Text('Demo Memorandum');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchBar,
        //Implementación parcial de la barra de búsqueda, sin terminar
        /*actions: [
          IconButton(onPressed: (){
            setState(() {
              if(navBarIcon.icon == Icons.search){
                navBarIcon = const Icon(Icons.cancel);
                searchBar = const ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 26
                  ),
                  title: TextField(
                    decoration: InputDecoration(
                      hintText: 'Buscar...',
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontStyle: FontStyle.italic
                      ),
                      border: InputBorder.none
                    ),
                    style: TextStyle(color: Colors.white),
                  ),

                );
              }
              else{
                navBarIcon = const Icon(Icons.search);
                searchBar = const Text('Demo Memorandum');
              }
            });
          },
              icon: navBarIcon)
        ],*/
        centerTitle: true,
      ),
      //Cuerpo de la página
      body: Padding(
        padding: const EdgeInsets.all(15),
        //Lista de elementos
        child: ListView(
          children: const [
            CustomListElement(title: 'Manzana', color: Colors.red, imgUrl: 'https://domf5oio6qrcr.cloudfront.net/medialibrary/6216/e522fb00-4fdb-4594-bdfa-fb72961f3da7.jpg',
              basicDescription: 'Una fruta roja', advancedDescription: 'Fruta pomácea de la especie Malus Domestica, originaria de Asia Central',),
            CustomListElement(title: 'Naranja', color: Colors.orange, imgUrl: 'https://naranjadevalencia.eu/wp-content/uploads/2016/09/Naranja-de-Valencia-fruta.jpg',
              basicDescription: 'Una fruta naranja', advancedDescription: 'Fruta proveniente del naranjo dulce o Citrus x sinensis. Un hesperidio carnoso',)
          ],
        )
      ),
    );
  }

}
//Widget custom que consiste de una tarjeta, su título, su foto y descripción básica, la avanzada es parte de los datos para la página extendida
class CustomListElement extends StatelessWidget{
  const CustomListElement({super.key,required this.title, required this.color,required this.imgUrl, required this.basicDescription, required this.advancedDescription});

  final String title;
  final String basicDescription;
  final String advancedDescription;
  final String imgUrl;
  final MaterialColor color;

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(title: title, color: color, advancedDescription: advancedDescription)));
    },
    child: Card(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(height: MediaQuery.of(context).size.height/7,
          child: Column(
            children: [
              Text(title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),),
              Row(
                children: [
                  Padding(padding: const EdgeInsets.all(5),child: Image(image: NetworkImage(imgUrl),
                    height: 70, width: 70,),),
                  Padding(padding: const EdgeInsets.fromLTRB(40, 5, 5, 5),child:
                  Text(basicDescription,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),)
                  )
                ],
              )
            ],
          ),)
    ),);
  }

}
//Página para mostrar la descripción extendida
class DetailPage extends StatelessWidget{
  const DetailPage({super.key,required this.title, required this.color, required this.advancedDescription });
  final String title;
  final String advancedDescription;
  final MaterialColor color;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
      body: Card(
          color: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          clipBehavior: Clip.antiAlias,
          child: SizedBox(height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Text(title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),),
                Padding(padding: const EdgeInsets.fromLTRB(40, 5, 5, 5),
                    child: Text(advancedDescription,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),)
                    )
              ],
            ),)
      ),
    );
  }

}
