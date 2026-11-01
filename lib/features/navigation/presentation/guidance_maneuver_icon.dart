import 'package:flutter/material.dart';

import '../../route_search/domain/entities/route_guidance.dart';

IconData guidanceManeuverIcon(ManeuverType type) => switch (type) {
  ManeuverType.depart => Icons.directions_walk,
  ManeuverType.continueStraight => Icons.straight,
  ManeuverType.keepLeft => Icons.turn_slight_left,
  ManeuverType.keepRight => Icons.turn_slight_right,
  ManeuverType.turnLeft => Icons.turn_left,
  ManeuverType.turnRight => Icons.turn_right,
  ManeuverType.uTurn => Icons.u_turn_left,
  ManeuverType.crossing => Icons.directions_walk,
  ManeuverType.stairs => Icons.stairs,
  ManeuverType.arrive => Icons.flag,
  ManeuverType.unknown => Icons.info_outline,
};
