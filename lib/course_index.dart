import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ui_training_5/main.dart';

class CourseIndex extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final _animationController = useAnimationController(
      duration: const Duration(milliseconds: 1000),
    );

    final _animationHorizontal = Tween<Offset>(
      begin: Offset(-1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));
    final _animationVertical = Tween<Offset>(
      begin: Offset(0.0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOutBack,
    ));
    _animationController.forward();


    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SlideTransition(
                position: _animationHorizontal,
                child: Header(title: 'Courses'),
              ),
              SlideTransition(
                position: _animationVertical,
                child: _Recommended(),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: (){
          _animationController.reverse().then((_) {
            Navigator.of(context).pop();
          });
        },
      ),
    );
  }
}

class _Recommended extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
          width: double.infinity,
          child: Text(
            'Recomended',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
        _CourseCard(
          title: 'Figma',
          subtitle: 'Figma Mastery',
          imgUrl: figmaLogoUrl,
        ),
        _CourseCard(
          title: 'Sketch',
          subtitle: 'Symbol Libraries',
          imgUrl: sketchLogoUrl,
        ),
        _CourseCard(
          title: 'Adobe XD',
          subtitle: 'Fundamentals of XD',
          imgUrl: xdLogoUrl,
        ),
        _CourseCard(
          title: 'Figma',
          subtitle: 'Figma Mastery',
          imgUrl: figmaLogoUrl,
        ),
        _CourseCard(
          title: 'Sketch',
          subtitle: 'Symbol Libraries',
          imgUrl: sketchLogoUrl,
        ),
        _CourseCard(
          title: 'Adobe XD',
          subtitle: 'Fundamentals of XD',
          imgUrl: xdLogoUrl,
        ),
      ],
    );
  }
}

class _CourseCard extends StatelessWidget{
  final String title;
  final String subtitle;
  final String imgUrl;

  const _CourseCard({
    @required this.title,
    @required this.subtitle,
    @required this.imgUrl
  }):super();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top:11),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [BoxShadow(
              offset: Offset(0,1.5),
              blurRadius: 0.5,
              color: Colors.black38
          )]
      ),
      padding: EdgeInsets.all(2),
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(10),
          ),
          width: 50,
          height: 50,
          padding: EdgeInsets.all(5),
          child: Image.network(imgUrl),
        ),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: IconButton(onPressed:(){}, icon: Icon(Icons.more_horiz),),
      )
    );
  }
}