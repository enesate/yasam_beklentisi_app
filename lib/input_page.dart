import 'package:flutter/material.dart';
import 'package:yasamsuresi/constants.dart';
import 'package:yasamsuresi/result_page.dart';
import 'package:yasamsuresi/user_data.dart';
import './icon_cinsiyet.dart';
import './my_container.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  var secilicinsiyet;
  double icilensigara = 15;
  int sporgunu = 3;
  int boy = 170;
  int kilo = 60;
  var isaret;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: MyContainer(child: buildRowOutlineButton('BOY')),
                ),
                Expanded(
                  child: MyContainer(
                    child: buildRowOutlineButton('KİLO'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Haftada Kaç Gün Spor Yapıyorsunuz?',
                    style: kMetinSitili,
                  ),
                  Text(
                    sporgunu.toString(),//s
                    style: kSayiSitili,
                  ),
                  Expanded(
                    child: Slider(
                        min: 0,
                        max: 7,
                        divisions: 7,
                        value: sporgunu.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            sporgunu = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: MyContainer(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Günde Kaç Sigara İçiyorsunuz?',
                    style: kMetinSitili,
                  ),
                  Text(
                    '${icilensigara.round()}',
                    style: kSayiSitili,
                  ),
                  Expanded(
                    child: Slider(
                        min: 0,
                        max: 30,
                        value: icilensigara,
                        onChanged: (double newValue) {
                          setState(() {
                            icilensigara = newValue;
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilicinsiyet = 'KADIN';
                      });
                    },
                    renk: secilicinsiyet == 'KADIN'
                        ? Colors.lightBlue
                        : Colors.white,
                    child: const MyIcon(cinsiyet: 'KADIN', sekil: Icons.female),
                  ),
                ),
                Expanded(
                  child: MyContainer(
                    onPress: () {
                      setState(() {
                        secilicinsiyet = 'ERKEK';
                      });
                    },
                    renk: secilicinsiyet == 'ERKEK'
                        ? Colors.lightBlue
                        : Colors.white,
                    child: const MyIcon(sekil: Icons.male, cinsiyet: 'ERKEK'),
                  ),
                ),
              ],
            ),
          ),
          ButtonTheme(
            height: 50,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultPage(UserData(
                              boy: boy,
                              icilensigara: icilensigara,
                              kilo: kilo,
                              sporgunu: sporgunu,
                              secilicinsiyet: secilicinsiyet))));
                },
                child: Text(
                  'HESAPLA',
                  style: kMetinSitili,
                )),
          )
        ],
      ),
    );
  }

  Row buildRowOutlineButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: kMetinSitili,
          ),
        ),
        SizedBox(width: 10),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'BOY' ? (boy.toString()) : (kilo.toString()),
            style: kSayiSitili,
          ),
        ),
        SizedBox(width: 20),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          OutlinedButton(
            onPressed: () {
              setState(() {
                label == 'BOY' ? boy++ : kilo++;
              });
            },
            style: kOutlineButton,
            child: const Icon(
              Icons.add,
              size: 15,
            ),
          ),
          OutlinedButton(
              onPressed: () {
                setState(() {
                  label == 'BOY' ? boy-- : kilo--;
                });
              },
              style: kOutlineButton,
              child: const Icon(
                Icons.remove,
                size: 15,
              )),
        ]),
      ],
    );
  }
}
