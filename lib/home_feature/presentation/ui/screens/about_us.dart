import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});
  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const AboutUs());
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width -
        MediaQuery.of(context).padding.along(Axis.horizontal);
    final deviceHeight = (MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.along(Axis.vertical) -
        kToolbarHeight);
    return Scaffold(
      appBar: AppBar(
        title: Text('Long Life Project'),
      ),
      body: ListView(
        children: [
          Card(
            child: Column(
              children: [
                Text(
                  'Mohamed Ayman',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/96664366?v=4',
                  height: deviceHeight * .3,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com/mayman5525'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @mayman5525  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Backend Team & Team Leader "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'Mahmoud Mosbah',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/46773011?v=4',
                  height: deviceHeight * .3,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com/Xmosb7'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @Xmosb7  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Backend Team  "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'Abdelwahab Mohamed',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/101150307?v=4',
                  height: deviceHeight * .3,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(
                        Uri.parse('https://github.com/abdelwahab-mohamed98'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @abdelwahab-mohamed98  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Frontend Team  "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'Mostafa Hussiny',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/113726825?v=4',
                  height: deviceHeight * .3,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com/Mostafa-Hussiny'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @Mostafa-Hussiny  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Frontend Team  "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'Nouran kadri',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/101168150?v=4',
                  height: deviceHeight * .25,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com/engnouran12'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @aengnouran12  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Flutter Team  "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'Omar Bahnasi',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://scontent.faly1-2.fna.fbcdn.net/v/t39.30808-6/279090781_1464913210589968_4635801902433082066_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=174925&_nc_eui2=AeG88MbBx6T5ANuMXmOYp96Q5gdUBMZUaBjmB1QExlRoGKoY3MJpdpIUJuY4hJPETL479VtxJ8B9Ws0nQnXSu3rX&_nc_ohc=-n5fdsU-OvEAX9Hr6kY&_nc_ht=scontent.faly1-2.fna&oh=00_AfBHJjloHgyV1PRbXc_gjaiLFmgllX7CNk7EtC62baFmeA&oe=64BCD2D5',
                  height: deviceHeight * .3,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com/omarbahnasi'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @omarbahnasi  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Flutter Team  "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // title says "Written and Directed BY "
          Center(
            child: Title(
              color: Color.fromARGB(255, 234, 160, 7),
              child: Text('WRITTEN AND \n DIRECTED BY ',
                  style: GoogleFonts.carterOne(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 234, 160, 7),
                      fontSize: 30,
                      shadows: [
                        Shadow(
                          offset: Offset(2.0, 2.0),
                          blurRadius: 3.0,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ],
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
          ),
          Card(
            child: Column(
              children: [
                Text(
                  'Magdy Samy',
                  style: TextStyle(fontSize: 20),
                ),
                Image.network(
                  'https://avatars.githubusercontent.com/u/86563979?v=4',
                  height: deviceHeight * .3,
                ),
                TextButton(
                  onPressed: () {
                    launchUrl(Uri.parse('https://github.com/octav8us'));
                  },
                  child: RichText(
                    maxLines: 2,
                    text: const TextSpan(
                      text: '  @octav8us  ',
                      style: TextStyle(color: Colors.blue),
                      children: [
                        WidgetSpan(
                          child: ImageIcon(
                            AssetImage('assets/images/github.png'),
                            size: 20,
                          ),
                        ),
                        WidgetSpan(
                          child: Text(" \n Flutter Team  "),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
