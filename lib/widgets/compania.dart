import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_movies/models/models.dart';
import 'package:project_movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class CompaniaWidget extends StatelessWidget {
  const CompaniaWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> _companies = [
      {
        'title': 'Marvel Studios',
        'image':
            'https://image.tmdb.org/t/p/w200/837VMM4wOkODc1idNxGT0KQJlej.png',
        'id': 7505
      },
      {
        'title': 'Locksmith Animation',
        'image':
            'https://image.tmdb.org/t/p/w200/4rc0vsJWygNm9ojrxSdPVU9jKyj.png',
        'id': 121605
      },
      {
        'title': '20th Century Studios',
        'image':
            'https://image.tmdb.org/t/p/w200//h0rjX5vjW5r8yEnUBStFarjcLT4.png',
        'id': 127928
      }
    ];

    return Container(
      margin: EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 130,
      child: ListView.builder(
          itemCount: _companies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, int index) =>
              _CarruselCompania(objComapania: _companies[index])),
    );
  }
}

class _CarruselCompania extends StatelessWidget {
  final objComapania;

  const _CarruselCompania({Key? key, required this.objComapania})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('compani: ${objComapania}');
    return Container(
      width: 200,
      height: 80,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'company',
                arguments: objComapania),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'),
                image: NetworkImage(objComapania['image']),
                width: 220,
                height: 90,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(height: 5),
          Text(objComapania['title'],
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center)
        ],
      ),
    );
  }
}
