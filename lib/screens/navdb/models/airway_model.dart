class AirwayModel{
  String identifier;
  String level;
  String directionRestriction;
  double minAltitude;
  double maxAltitude;
  String startWaypoint;
  String endWaypoint;
  String type;

  AirwayModel(this.identifier, this.level, this.directionRestriction,
      this.minAltitude, this.maxAltitude, this.startWaypoint, this.endWaypoint, this.type);
}

final airwayList = [
  new AirwayModel('T363', 'L', 'F', 14500, 28500, 'LATGA', 'ESB', 'R'),
  new AirwayModel('T363', 'L', 'F', 14500, 28500, 'ESB', 'GURBU', 'R'),
  new AirwayModel('T364', 'L', 'F', 9500, 28500, 'ESB', 'ILHAN', 'R'),
  new AirwayModel('T364', 'L', 'F', 9500, 28500, 'ILHAN', 'ESB', 'R'),
  new AirwayModel('T44', 'L', 'F', 9500, 28500, 'ILHAN', 'ESB', 'R'),
  new AirwayModel('T44', 'L', 'F', 9500, 28500, 'ILHAN', 'ESB', 'R'),
  new AirwayModel('T44', 'L', 'F', 9500, 28500, 'ILHAN', 'ESB', 'R'),
  new AirwayModel('T44', 'L', 'F', 9500, 28500, 'ILHAN', 'ESB', 'R'),

];