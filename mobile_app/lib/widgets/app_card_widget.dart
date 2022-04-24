import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/md_quebradas/blocs/quebrada_bloc.dart';

class AppCardWidget extends StatelessWidget {

  final ImageProvider image;
  final String title;
  final String subtitle;
  final String footer;
  final String route;

  const AppCardWidget({ 
    Key? key,
    this.image = const AssetImage('assets/empty.png'),
    this.title = 'Title', 
    this.subtitle = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec mattis ipsum odio, sed semper sapien lobortis id. Proin eu ullamcorper ante, a tincidunt dolor. Sed sit amet turpis sollicitudin, facilisis est at, ultricies sapien. Nam finibus aliquet ex, sit amet sagittis felis lacinia eu. Duis ante felis, auctor eu metus nec, tempus pulvinar diam. Nam vulputate tincidunt magna in consectetur. Integer eget eros at nibh porttitor sollicitudin.',
    this.footer = '',
    this.route = 'home',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context,route);
          //BlocProvider.of<QuebradaBloc>(context).add(SetQuebradasEvent('xd'));
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(1),
          backgroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10) 
            )),
          ),
        child: Card(
          elevation: 0,
          child: SizedBox(
            height: 100,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  backgroundImage: image,
                  radius: 25
                ),
                const SizedBox(width: 20),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(title,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Text(subtitle,maxLines: 2,style: const TextStyle(fontSize: 12)),
                      Visibility(
                        visible: footer.isNotEmpty,
                        child: Text(footer,style: const TextStyle(fontSize: 12)))
                    ],
                  )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}