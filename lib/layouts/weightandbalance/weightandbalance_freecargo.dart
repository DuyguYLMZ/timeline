import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tablet_app/model/weightandbalancemodel/cargo.dart';
import 'package:tablet_app/values/theme.dart';

class FreeCargo extends StatelessWidget {
  var size;
  BuildContext _context;
  static Cargo cargo1 = new Cargo("Ekip Dokümanları", 0, 3.705, 0);
  static Cargo cargo2 = new Cargo("Ekip Bagajı", 0, 3.705, 0);
  static Cargo cargo3 = new Cargo("Steward Ekipmanı", 0, 3.705, 0);
  static Cargo cargo4 = new Cargo("Acil Durum Ekipmanı", 0, 3.705, 0);
  static Cargo cargo5 = new Cargo("Ekstra Ekipman", 0, 3.705, 0);
  List<Cargo> cargos = [cargo1, cargo2, cargo3, cargo3, cargo4, cargo5];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    _context = context;
    return ListView.builder(
        itemCount: cargos.length,
        itemBuilder: (context, index) {
          final item = cargos[index];
          return ListTile(
            title: Text('${item.name}'),
            subtitle:
                Text('${item.weight}\t' + '${item.arm}\t' + '${item.moment}'),
            onTap: () => onTapped(item),
          );
        });
  }

  onTapped(Cargo item) {
    showDialog(
        context: _context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width / 2,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: drawerBackgroundColor,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 50,
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                boxShadow: <BoxShadow>[
                                  BoxShadow(
                                      color: Colors.black54,
                                      blurRadius: 5.0,
                                      offset: Offset(0.0, 0.75))
                                ],
                                color: backgroundColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                              ),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item.name,
                                  style: defaultWhiteTitleStyle,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(8),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                          child: new Text(
                                            "Ağırlık : ",
                                            style: defaultWhiteBigStyle,
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: size.width / 4,
                                            child: TextField(
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.all(8),
                                                fillColor: white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                hintText: '${item.weight}',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              autofocus: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(color: grey, height: 25.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              7,
                                          child: new Text(
                                            "Arm : ",
                                            style: defaultWhiteBigStyle,
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            width: size.width / 4,
                                            child: TextField(
                                              onChanged: (text) {
                                                item.setArm(double.parse(text));
                                              },
                                              decoration: InputDecoration(
                                                isDense: true,
                                                contentPadding:
                                                    EdgeInsets.all(8),
                                                fillColor: white,
                                                filled: true,
                                                border: OutlineInputBorder(),
                                                hintText: '${item.weight}',
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              autofocus: false,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(color: grey, height: 25.0),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            item.setArm(44.4);
                            setState((){

                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.blue[300],
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(12),
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Tamam",
                                style: defaultWhiteBigStyle,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        // These values are based on trial & error method
                        alignment: Alignment(1.05, -1.05),
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: backgroundColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.close,
                              color: white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
