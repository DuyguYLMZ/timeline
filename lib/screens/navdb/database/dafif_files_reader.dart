
import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:path_provider/path_provider.dart';

class DafifDataImporter extends StatelessWidget{


  @override
  Widget build(BuildContext context) {

    return Container();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  /// Assumes the given path is a text-file-asset.
  Future<String> getFileData(String path) async {
    return await rootBundle.loadString(path);
  }

  Future<String> readFile(){
    return getFileData('assets/dafif/ARPT/ARPT.txt');
  }

  void readAndGenerateAirportTable(){

   /* Database db = new Database();
    //db.deleteAllDafifAirfieldEntries();
    readFile().then((s){
      List<String> lineChunks = s.split('\n');
      for( var i = 3 ; i < 10; i++ ) {
        List<String> fieldEntries = lineChunks[i].split('\t');
        db.createDafifAirfieldEntry(DafifAirfieldCompanion(
          arptident: Value(fieldEntries[0]),
          name: Value(fieldEntries[1]),
          stateprov: Value(fieldEntries[2]),
          icao: Value(fieldEntries[3]),
          faahostid: Value(fieldEntries[4]),
          lochdatum: Value(fieldEntries[5]),
          wgsdatum: Value(fieldEntries[6]),
          wgslat: Value(fieldEntries[7]),
          wgsdlat: Value(fieldEntries[8]),
          wgslong: Value(fieldEntries[9]),
          wgsdlong: Value(fieldEntries[10]),
          elev: Value(fieldEntries[11]),
          type: Value(fieldEntries[12]),
          magvar: Value(fieldEntries[13]),
          wac: Value(fieldEntries[14]),
          beacon: Value(fieldEntries[15]),
          secondarpt: Value(fieldEntries[16]),
          opragy: Value(fieldEntries[17]),
          secname: Value(fieldEntries[18]),
          secicao: Value(fieldEntries[19]),
          secfaa: Value(fieldEntries[20]),
          secopragy: Value(fieldEntries[21]),
          cycledate: Value(fieldEntries[22]),
          terrain: Value(fieldEntries[23]),
          hydro: Value(fieldEntries[24]),
        )).then((th){

        }).catchError((onError){
          print('Error on creating Airport Record');
          print(onError);
        });

      }

    }).catchError((handle){
      print(handle);
    });*/
  }
}


