import 'crew.dart';

class CrewList {
  static List<Crew> _crewList = new List<Crew>();

  List<Crew> get crewList => _crewList;

  set crewList(List<Crew> value) {
    _crewList = value;
  }

  void addcrew(Crew crew) {
    _crewList.add(crew);
  }
}
