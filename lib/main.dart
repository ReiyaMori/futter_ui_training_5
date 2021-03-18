import 'package:flutter/material.dart';

void main()=>runApp(new MyApp());

//参考：https://dribbble.com/shots/11590683-TurtleU

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'LEaRn ONLINE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home: MyHomePage(),
    );
  }
}

/*画像URLたち*/
const figmaLogoUrl =
    'https://user-images.githubusercontent.com/7200238/83031886-1ce87880-a070-11ea-89c8-5cee840d5782.png';
const sketchLogoUrl =
    'https://user-images.githubusercontent.com/7200238/83145378-a7dc7800-a12f-11ea-93e1-32c7982c5e63.png';
const xdLogoUrl =
    'https://user-images.githubusercontent.com/7200238/83145578-f558e500-a12f-11ea-85fa-3e26a966d180.png';

/*FVページ*/
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _Header(title: 'TurtleU'),
              _Hero(),
              _Featured(),
              _TrendingCourses(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.list),
      ),
    );
  }
}

class _Header extends StatelessWidget{
  final String title;
  const _Header({this.title}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 24),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
    );
  }
}

class _Hero extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFDFEAF9),
        borderRadius: BorderRadius.circular(16)
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 150,
            child: Text(
              'Choose from over 100,000 online video courses',
              style: TextStyle(fontWeight: FontWeight.w500),
            )
          ),
          SizedBox(height: 10,),
          ElevatedButton(
            onPressed: (){},
            child: Text('Browse all courses'),
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(horizontal: 25,vertical: 13)
            )
          )
        ],
      ),
    );
  }
}

class _Featured extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 35,),
        Container(
          width: double.infinity,
          child: Text(
            'Featured',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top:25),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [BoxShadow(
                      offset: Offset(0,1.5),
                      blurRadius: 0.5,
                      color: Colors.black54
                  )]
              ),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.navigate_before),
                  Container(
                    width: 200,
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Figma: Solid Foundations',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text('The most complete beginner to advanced guide',textAlign: TextAlign.center,)
                      ],
                    ),
                  ),
                  Icon(Icons.navigate_next)
                ],
              ),
            ),
            Align(alignment: Alignment.topCenter ,child: _FigmaLogo())
          ],
        ),
      ],
    );
  }
}

class _FigmaLogo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: ClipOval(
        child: Container(
          width: 50,
          height: 50,
          color: Colors.black,
          padding: EdgeInsets.all(8),
          child: Image.network(figmaLogoUrl),

        ),
      ),
    );
  }
}

class _TrendingCourses extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 35,),
        Container(
          width: double.infinity,
          child: Text(
            'Trending Courses',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top:25),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [BoxShadow(
                  offset: Offset(0,1.5),
                  blurRadius: 0.5,
                  color: Colors.black54
              )]
          ),
          padding: EdgeInsets.all(15),
          child:Column(
            children: [
              _SkillCard(name: 'Communication Skills'),
              _SkillCard(name: 'Digital Marketing 101'),
              _SkillCard(name: 'UX Research'),
              ElevatedButton(
                  onPressed: (){},
                  child: Container(
                      width: double.infinity,
                      child: Text('View trending list', textAlign: TextAlign.center,)),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.symmetric(vertical: 13)
                  )
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SkillCard extends StatelessWidget{
  final String name;
  const _SkillCard({this.name}):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Color(0xFFF6F6F6),
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.school,
            color: Colors.blue,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}