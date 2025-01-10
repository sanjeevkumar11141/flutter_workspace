import 'package:flutter/material.dart';

const image1 =
    'https://whc.unesco.org/uploads/thumbs/site_0798_0006-1000-627-20120827171714.jpg';
const image2 = 'https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/Sundarban_Tiger.jpg/1200px-Sundarban_Tiger.jpg';
const image3 = 'https://pathfriend-bd.com/wp-content/uploads/2019/08/Sundarban-Kotka-Sanctuary.jpg';
const image4 = 'https://bdembassymexico.org/wp-content/uploads/2019/07/Sundarban-the-largest-Mangroove-Forest.jpg';

const sundarban =
'''The Sundarbans mangrove forest, one of the largest such forests in the world (140,000 ha), lies on the delta of the Ganges, Brahmaputra and Meghna rivers on the Bay of Bengal. It is adjacent to the border of India’s Sundarbans World Heritage site inscribed in 1987. The site is intersected by a complex network of tidal waterways, mudflats and small islands of salt-tolerant mangrove forests, and presents an excellent example of ongoing ecological processes. The area is known for its wide range of fauna, including 260 bird species, the Bengal tiger and other threatened species such as the estuarine crocodile and the Indian python.''';


class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final imageList = [image1, image2, image3, image4,];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Example'),),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageSection(),
            _headerSection(),
            _navigationSection(),
            _bodySection(),
          ],
        ),
      ),
    );
  }

  Widget _bodySection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(sundarban),
    );
  }

  Widget _navigationSection() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.call, color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'CALL',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.near_me, color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'ROUTE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.share, color: Colors.blue),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _headerSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'The Sundarbans',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                'Khulna Division, Bharat',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.star,
            color: Colors.amber,
          ),
          Text(
            '9.5',
          )
        ],
      ),
    );
  }

  Widget _imageSection() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Image.network(
          imageList[index],
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
        Positioned.fill(
          child: Center(
            child: Text(
              'Sundarbans',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: -20,
          left: 10,
          child: Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite,
                size: 50,
                color: Colors.amber,
              ),
            ),
          ),
        ),
        Positioned(
          right: 4,
          bottom: 4,
          child: ElevatedButton(
            onPressed: index == imageList.length - 1 ? null : () {
              setState(() {
                index++;
              });
            },
            child: Text('>>'),
          ),
        ),
        Positioned(
          left: 4,
          bottom: 4,
          child: ElevatedButton(
            onPressed: index == 0 ? null : () {
              setState(() {
                index--;
              });
            },
            child: Text('<<'),
          ),
        ),
      ],
    );
  }
}