

import 'package:tablet_app/util/wabconfigurationmodel.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tablet_app/util/wabitems/WABItem.dart';
import 'package:tablet_app/util/wabitems/WABItemCargo.dart';
import 'package:tablet_app/util/wabitems/WABItemFueltank.dart';
import 'package:tablet_app/util/wabitems/WABItemLoadable.dart';
import 'package:tablet_app/util/wabitems/WABItemSeat.dart';
import 'package:xml/xml.dart' as xml;
import 'package:xml/xml.dart';

class XMLParser {
   WABConfigurationModel _model = new WABConfigurationModel();

  XMLParser();

  parseXML() async {
    WidgetsFlutterBinding.ensureInitialized();
    String filePath = 'assets/xml/WeightAndBalance.xml'; //use xmlPath to generalize
    String content = await rootBundle.loadString(filePath);
    XmlDocument aircraftInfo = xml.parse(content);

    parseAirCraftInfo(aircraftInfo);
    parseElement(aircraftInfo);
  }

  parseAirCraftInfo(var aircraftInfo) {
    final loadType = aircraftInfo
        .findAllElements('load-type')
        .map((node) => node.text)
        .first;

    final baseWeightStr = aircraftInfo
        .findAllElements('base-weight')
        .map((node) => node.text)
        .first;
    double baseWeight = double.tryParse(baseWeightStr);

    final baseMomentStr = aircraftInfo
        .findAllElements('base-moment')
        .map((node) => node.text)
        .first;
    double baseMoment = double.tryParse(baseMomentStr);

    final maxTaxiWeightStr = aircraftInfo
        .findAllElements('max-taxi-weight')
        .map((node) => node.text)
        .first;
    double maxTaxiWeight = double.tryParse(maxTaxiWeightStr);

    final maxTakeOffWeightStr = aircraftInfo
        .findAllElements('max-takeoff-weight')
        .map((node) => node.text)
        .first;
    double maxTakeOffWeight = double.tryParse(maxTakeOffWeightStr);

    final maxZeroFuelWeightStr = aircraftInfo
        .findAllElements('max-zero-fuel-weight')
        .map((node) => node.text)
        .first;
    double maxZeroFuelWeight = double.tryParse(maxZeroFuelWeightStr);

    final maxLandingWeightStr = aircraftInfo
        .findAllElements('max-landing-weight')
        .map((node) => node.text)
        .first;
    double maxLandingWeight = double.tryParse(maxLandingWeightStr);

    final minMacPercentageStr = aircraftInfo
        .findAllElements('min-mac-percentage')
        .map((node) => node.text)
        .first;
    double minMacPercentage = double.tryParse(minMacPercentageStr);

    final maxMacPercentageStr = aircraftInfo
        .findAllElements('max-mac-percentage')
        .map((node) => node.text)
        .first;
    double maxMacPercentage = double.tryParse(maxMacPercentageStr);

    final lemacStr =
        aircraftInfo.findAllElements('lemac').map((node) => node.text).first;
    double lemac = double.tryParse(lemacStr);

    final macStr =
        aircraftInfo.findAllElements('mac').map((node) => node.text).first;
    double mac = double.tryParse(macStr);

    final weightUnit = aircraftInfo
        .findAllElements('weight-unit')
        .map((node) => node.text)
        .first;
    final armUnit =
        aircraftInfo.findAllElements('arm-unit').map((node) => node.text).first;
    final momentUnit = aircraftInfo
        .findAllElements('moment-unit')
        .map((node) => node.text)
        .first;
    final lemacUnit = aircraftInfo
        .findAllElements('lemac-unit')
        .map((node) => node.text)
        .first;
    final macUnit =
        aircraftInfo.findAllElements('mac-unit').map((node) => node.text).first;

    final aircraftLengthStr = aircraftInfo
        .findAllElements('aircraft-length')
        .map((node) => node.text)
        .first;
    double aircraftLength = double.tryParse(aircraftLengthStr);

    final aircraftWingSpanStr = aircraftInfo
        .findAllElements('aircraft-wing-span')
        .map((node) => node.text)
        .first;
    double aircraftWingSpan = double.tryParse(aircraftWingSpanStr);

    final flapsDownUpMomentChangeStr = aircraftInfo
        .findAllElements('flaps-down-to-up-moment-change')
        .map((node) => node.text)
        .first;
    double flapsDownUpMomentChange =
        double.tryParse(flapsDownUpMomentChangeStr);

    final gearsDownUpMomentChangeStr = aircraftInfo
        .findAllElements('gears-down-to-up-moment-change')
        .map((node) => node.text)
        .first;
    double gearsDownUpMomentChange =
        double.tryParse(gearsDownUpMomentChangeStr);

    final fuelLoadCalculator = aircraftInfo
        .findAllElements('fuel-load-calculator')
        .map((node) => node.text)
        .first;
    final fuelTankValidator = aircraftInfo
        .findAllElements('fuel-tank-validator')
        .map((node) => node.text)
        .first;
    final armamentValidator = aircraftInfo
        .findAllElements('armament-validator')
        .map((node) => node.text)
        .first;

    _model.acInfo.loadType = loadType;
    _model.acInfo.baseWeight = baseWeight;
    _model.acInfo.baseMoment = baseMoment;
    _model.acInfo.maxTaxiWeight = maxTaxiWeight;
    _model.acInfo.maxTakeOffWeight = maxTakeOffWeight;
    _model.acInfo.maxZerofuelWeight = maxZeroFuelWeight;
    _model.acInfo.maxLandingWeight = maxLandingWeight;
    _model.acInfo.minMacPercentage = minMacPercentage;
    _model.acInfo.maxMacPercentage = maxMacPercentage;
    _model.acInfo.lemac = lemac;
    _model.acInfo.mac = mac;
    _model.acInfo.weightUnit = weightUnit;
    _model.acInfo.armUnit = armUnit;
    _model.acInfo.momentUnit = momentUnit;
    _model.acInfo.lemacUnit = lemacUnit;
    _model.acInfo.macUnit = macUnit;
    _model.acInfo.acLength = aircraftLength;
    _model.acInfo.acWingSpan = aircraftWingSpan;
    _model.acInfo.flapsDownToUpMomentChange = flapsDownUpMomentChange;
    _model.acInfo.gearsDownToUpMomentChange = gearsDownUpMomentChange;
    _model.acInfo.fuelLoadCalculator = fuelLoadCalculator;
    _model.acInfo.fuelTankValidator = fuelTankValidator;
    _model.acInfo.armamentValidator = armamentValidator;
  }

  parseElement(var document) {
    final elements = document.findAllElements('configuration-group').toList();
    for (XmlElement element in elements) {
      String name = element.attributes.first.value;
      findAllElements(element, name);
    }

    //map kullanılabilir "configuration-item for attribute"  ile "configuration-group type attribute aynı isim
    final loadableTypes =
        document.findAllElements('configuration-type').toList();
    for (XmlElement loadableType in loadableTypes) {
      String forWhich = loadableType.getAttribute('for');

      final loadableItems =
          loadableType.findAllElements('configuration-element').toList();
      List<WABItemLoadable> items = new List<WABItemLoadable>();
      for (int i = 0; i < loadableItems.length; i++) {
        WABItemLoadable item = new WABItemLoadable();

        item.type = loadableItems.elementAt(i).getAttribute('type');

        String weightStr = loadableItems.elementAt(i).getAttribute('weight');
        double weight;
        if (weightStr != null && weightStr != '') {
          weight = num.tryParse(weightStr);
        } else {
          weight = 0;
        }

        item.weight = weight;

        String maxWeightStr =
            loadableItems.elementAt(i).getAttribute('max-weight');
        double maxWeight;
        if (maxWeightStr != null && maxWeightStr != '') {
          maxWeight = double.tryParse(maxWeightStr);
        } else {
          maxWeight = 0;
        }
        item.maxWeight = maxWeight;
        item.dimensions = loadableItems.elementAt(i).getAttribute('dimensions');
        item.labelAlignment =
            loadableItems.elementAt(i).getAttribute('labelAlignment');

        items.add(item);
      }
      if (forWhich == 'seats') {
        _model.itemsForSeats.addAll(items);
      } else if (forWhich == 'fixed-cargo') {
        _model.itemsForCargo.addAll(items);
      } else if (forWhich == 'cargo') {
        _model.itemsForCargo.addAll(items);
      }
    }
  }

  Future<String> testParser() async {
    WidgetsFlutterBinding.ensureInitialized();
    String filePath = 'assets/xml/WeightAndBalance.xml';
    xml.XmlDocument document;
    String content = await rootBundle.loadString(filePath)
        .then((String content){
      document = xml.parse(content);
      print(document);
      return content;
    });



    var weights = document.findAllElements('configuration-group')
        .where((element) => element.getAttribute('type') == 'cargo'
        || element.getAttribute('type') == 'fixed-cargo'
            && !(element is xml.XmlText)).map((element) => element.children);
    print(weights.toString());

    var wabConf = document
        .findAllElements('wab-configuration')
        .first
        .children
        .toList()
        .forEach((xml.XmlNode node) {
      if (!(node is xml.XmlText)) {
        xml.XmlElement eachElement = node;
        switch (eachElement.getAttribute('type')) {
          case 'aircraft-info':
            {}
            break;
          case 'view-options':
            {}
            break;
          case 'configuration-group':
            {}
            break;
          case 'configuration-type':
            {}
            break;
          case 'configuration-definition':
            {}
            break;
          case 'drawing-item-group':
            {}
            break;
          case 'station-list':
            {
              eachElement.children.toList().forEach((xml.XmlNode node) {
                xml.XmlElement child = node;
                WABItem station = convertToItem(child);
                _model.stationList.add(station);
              });
            }
            break;
          case 'cargo-constraints':
            {
              eachElement.children.toList().forEach((xml.XmlNode node) {
                xml.XmlElement child = node;
                WABItem item = convertToItem(child);
                _model.cargoConstraints.add(item);
              });
            }
            break;
        }
      }
    });

    var drawingItemGroup = document
        .findAllElements('drawing-item-group')
        .toList()
        .forEach((xml.XmlElement element) {
      List<String> drawItemList = new List<String>();
      drawItemList.add(element.getAttribute('type'));
      for (xml.XmlNode child in element.children) {
        if (!(child is XmlText)) {
          xml.XmlElement newChild = child;
          newChild.attributes.toList().forEach((xml.XmlAttribute attribute) {
            drawItemList.add(attribute.value);
          });
        }
      }
      _model.drawItems.add(drawItemList);
    });

    return xml.parse(content).toString();
  }

  parseConfigurationGroup(XmlNode node) {
    xml.XmlElement confGroup = node;
    WABItem item;

    switch (confGroup.getAttribute('type')) {
      case 'seats':
        {
          item = new WABItemSeat();
          confGroup.attributes
              .toList()
              .forEach((xml.XmlAttribute attribute) {});
        }
        break;
      case 'fuel-tanks':
        {
          item = new WABItemFueltank();
        }
        break;
      case 'cargo':
        {
          item = new WABItemCargo();
        }
        break;
      default:
        {
          item = new WABItem();
        }
        break;
    }
  }

//  test (List<xml.XmlNode> nodeList){
//    nodeList.add(nodeList.first.parent.attributes.first);
//  }

  findAllElements(xml.XmlElement parent, String type) {
    var childList = parent.findAllElements('configuration-item').toList();



    for (xml.XmlElement child in childList) {
      WABItem item;
      if (type == 'seats') {
        item = new WABItemSeat();
      } else if (type == 'fuel-tanks') {
        item = new WABItemFueltank();
      } else if (type == 'cargo' || type == 'fixed-cargo') {
        item = new WABItemCargo();
      } else {
        item = new WABItem();
      }
      item.type = child.getAttribute('type');
      item.id = child.getAttribute('id');

      String multiLoadableStr = child.getAttribute('multi-loadable');
      if (multiLoadableStr != null ) {
        if(multiLoadableStr.toLowerCase() == 'true'){
          item.multiLoadable = true;
        }
      } else {
        item.multiLoadable = false;
      }

      String weightStr = child.getAttribute('weight');
      double weight;
      if (weightStr != null && weightStr != '') {
        weight = double.tryParse(weightStr);
      } else {
        weight = 0;
      }
      item.weight = weight;

      String maxWeightStr = child.getAttribute('max-weight');
      double maxWeight;
      if (maxWeightStr != null && maxWeightStr != '') {
        maxWeight = double.tryParse(maxWeightStr);
      } else {
        maxWeight = 0;
      }
      item.maxWeight = maxWeight;

      item.location = child.getAttribute('location');
      item.dimension = child.getAttribute('dimensions');

      item.labelAlignment = child.getAttribute('label-alignment');

      String startArmStr = child.getAttribute('start-arm');
      double startArm;
      if (startArmStr != null && startArmStr != '') {
        startArm = double.tryParse(startArmStr);
      } else {
        startArm = 0;
      }
      item.startArm = startArm;

      String endArmStr = child.getAttribute('end-arm');
      double endArm;
      if (endArmStr != null && endArmStr != '') {
        endArm = double.tryParse(endArmStr);
      } else {
        endArm = 0;
      }
      item.endArm = endArm;
      if(type == 'crews'){
        _model.crewsList.add(item);
      }else if(type == 'free-cargo'){
        _model.freeCargo.add(item);
      }

      if (item is WABItemSeat) {
        String rowNumberStr = child.getAttribute('row-number');
        int rowNumber;
        if (rowNumberStr != null && rowNumberStr != '') {
          rowNumber = int.parse(rowNumberStr);
        } else {
          rowNumber = 0;
        }
        item.rowNumber = rowNumber;
        _model.seats.add(item);
      } else if (item is WABItemFueltank) {
        String maxCapacityStr = child.getAttribute('max-capacity');
        double maxCapacity;
        if (maxCapacityStr != null && maxCapacityStr != '') {
          maxCapacity = double.parse(maxCapacityStr);
        } else {
          maxCapacity = 0;
        }
        item.maxCapacity = maxCapacity;

        String fuelDensityStr = child.getAttribute('fuel-density');
        double fuelDensity;
        if (fuelDensityStr != null && fuelDensityStr != '') {
          fuelDensity = double.parse(fuelDensityStr);
        } else {
          fuelDensity = 0;
        }
        item.fuelDensity = fuelDensity;
        _model.fuelTanks.add(item);
      } else if (item is WABItemCargo) {
        String isFixed = child.getAttribute('is-fixed');
        item.isFixed = isFixed;
        _model.cargos.add(item);
      }
    }
  }

  convertToItem(xml.XmlElement element){
    xml.XmlElement parent = element.parent;
    String type = parent.getAttribute('type');

    WABItem item;
    if (type == 'seats') {
      item = new WABItemSeat();
    } else if (type == 'fuel-tanks') {
      item = new WABItemFueltank();
    } else if (type == 'cargo' || type == 'fixed-cargo') {
      item = new WABItemCargo();
    } else {
      item = new WABItem();
    }

    item.type = element.getAttribute('type');
    item.id = element.getAttribute('id');

    String multiLoadableStr = element.getAttribute('multi-loadable');
    if (multiLoadableStr != null ) {
      if(multiLoadableStr.toLowerCase() == 'true'){
        item.multiLoadable = true;
      }
    } else {
      item.multiLoadable = false;
    }

    String weightStr = element.getAttribute('weight');
    double weight;
    if (weightStr != null && weightStr != '') {
      weight = double.tryParse(weightStr);
    } else {
      weight = 0;
    }
    item.weight = weight;

    String maxWeightStr = element.getAttribute('max-weight');
    double maxWeight;
    if (maxWeightStr != null && maxWeightStr != '') {
      maxWeight = double.tryParse(maxWeightStr);
    } else {
      maxWeight = 0;
    }
    item.maxWeight = maxWeight;

    item.location = element.getAttribute('location');
    item.dimension = element.getAttribute('dimensions');

    item.labelAlignment = element.getAttribute('label-alignment');

    String startArmStr = element.getAttribute('start-arm');
    double startArm;
    if (startArmStr != null && startArmStr != '') {
      startArm = double.tryParse(startArmStr);
    } else {
      startArm = 0;
    }
    item.startArm = startArm;

    String endArmStr = element.getAttribute('end-arm');
    double endArm;
    if (endArmStr != null && endArmStr != '') {
      endArm = double.tryParse(endArmStr);
    } else {
      endArm = 0;
    }
    item.endArm = endArm;

    if (item is WABItemSeat) {
      String rowNumberStr = element.getAttribute('row-number');
      int rowNumber;
      if (rowNumberStr != null && rowNumberStr != '') {
        rowNumber = int.parse(rowNumberStr);
      } else {
        rowNumber = 0;
      }
      item.rowNumber = rowNumber;
    } else if (item is WABItemFueltank) {
      String maxCapacityStr = element.getAttribute('max-capacity');
      double maxCapacity;
      if (maxCapacityStr != null && maxCapacityStr != '') {
        maxCapacity = double.parse(maxCapacityStr);
      } else {
        maxCapacity = 0;
      }
      item.maxCapacity = maxCapacity;

      String fuelDensityStr = element.getAttribute('fuel-density');
      double fuelDensity;
      if (fuelDensityStr != null && fuelDensityStr != '') {
        fuelDensity = double.parse(fuelDensityStr);
      } else {
        fuelDensity = 0;
      }
      item.fuelDensity = fuelDensity;
    } else if (item is WABItemCargo) {
      String isFixed = element.getAttribute('is-fixed');
      item.isFixed = isFixed;
    }

    return item;
  }

  WABConfigurationModel get model => _model;

  set model(WABConfigurationModel value) {
    _model = value;
  }
}
