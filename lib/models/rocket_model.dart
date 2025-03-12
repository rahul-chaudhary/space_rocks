// SpaceX Rocket Models

class RocketList {
  final List<Rocket> rockets;

  RocketList({required this.rockets});

  factory RocketList.fromJson(List<dynamic> json) {
    return RocketList(
      rockets: json.map((e) => Rocket.fromJson(e)).toList(),
    );
  }

  List<dynamic> toJson() {
    return rockets.map((e) => e.toJson()).toList();
  }
}

class Rocket {
  final Dimension height;
  final Dimension diameter;
  final Mass mass;
  final FirstStage firstStage;
  final SecondStage secondStage;
  final Engines engines;
  final LandingLegs landingLegs;
  final List<PayloadWeight> payloadWeights;
  final List<String> flickrImages;
  final String name;
  final String type;
  final bool active;
  final int stages;
  final int boosters;
  final int costPerLaunch;
  final int successRatePct;
  final String firstFlight;
  final String country;
  final String company;
  final String wikipedia;
  final String description;
  final String id;

  Rocket({
    required this.height,
    required this.diameter,
    required this.mass,
    required this.firstStage,
    required this.secondStage,
    required this.engines,
    required this.landingLegs,
    required this.payloadWeights,
    required this.flickrImages,
    required this.name,
    required this.type,
    required this.active,
    required this.stages,
    required this.boosters,
    required this.costPerLaunch,
    required this.successRatePct,
    required this.firstFlight,
    required this.country,
    required this.company,
    required this.wikipedia,
    required this.description,
    required this.id,
  });

  factory Rocket.fromJson(Map<String, dynamic> json) {
    return Rocket(
      height: Dimension.fromJson(json['height']),
      diameter: Dimension.fromJson(json['diameter']),
      mass: Mass.fromJson(json['mass']),
      firstStage: FirstStage.fromJson(json['first_stage']),
      secondStage: SecondStage.fromJson(json['second_stage']),
      engines: Engines.fromJson(json['engines']),
      landingLegs: LandingLegs.fromJson(json['landing_legs']),
      payloadWeights: (json['payload_weights'] as List)
          .map((e) => PayloadWeight.fromJson(e))
          .toList(),
      flickrImages: List<String>.from(json['flickr_images']),
      name: json['name'],
      type: json['type'],
      active: json['active'],
      stages: json['stages'],
      boosters: json['boosters'],
      costPerLaunch: json['cost_per_launch'],
      successRatePct: json['success_rate_pct'],
      firstFlight: json['first_flight'],
      country: json['country'],
      company: json['company'],
      wikipedia: json['wikipedia'],
      description: json['description'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height.toJson(),
      'diameter': diameter.toJson(),
      'mass': mass.toJson(),
      'first_stage': firstStage.toJson(),
      'second_stage': secondStage.toJson(),
      'engines': engines.toJson(),
      'landing_legs': landingLegs.toJson(),
      'payload_weights': payloadWeights.map((e) => e.toJson()).toList(),
      'flickr_images': flickrImages,
      'name': name,
      'type': type,
      'active': active,
      'stages': stages,
      'boosters': boosters,
      'cost_per_launch': costPerLaunch,
      'success_rate_pct': successRatePct,
      'first_flight': firstFlight,
      'country': country,
      'company': company,
      'wikipedia': wikipedia,
      'description': description,
      'id': id,
    };
  }

  Rocket copyWith({
    Dimension? height,
    Dimension? diameter,
    Mass? mass,
    FirstStage? firstStage,
    SecondStage? secondStage,
    Engines? engines,
    LandingLegs? landingLegs,
    List<PayloadWeight>? payloadWeights,
    List<String>? flickrImages,
    String? name,
    String? type,
    bool? active,
    int? stages,
    int? boosters,
    int? costPerLaunch,
    int? successRatePct,
    String? firstFlight,
    String? country,
    String? company,
    String? wikipedia,
    String? description,
    String? id,
  }) {
    return Rocket(
      height: height ?? this.height,
      diameter: diameter ?? this.diameter,
      mass: mass ?? this.mass,
      firstStage: firstStage ?? this.firstStage,
      secondStage: secondStage ?? this.secondStage,
      engines: engines ?? this.engines,
      landingLegs: landingLegs ?? this.landingLegs,
      payloadWeights: payloadWeights ?? this.payloadWeights,
      flickrImages: flickrImages ?? this.flickrImages,
      name: name ?? this.name,
      type: type ?? this.type,
      active: active ?? this.active,
      stages: stages ?? this.stages,
      boosters: boosters ?? this.boosters,
      costPerLaunch: costPerLaunch ?? this.costPerLaunch,
      successRatePct: successRatePct ?? this.successRatePct,
      firstFlight: firstFlight ?? this.firstFlight,
      country: country ?? this.country,
      company: company ?? this.company,
      wikipedia: wikipedia ?? this.wikipedia,
      description: description ?? this.description,
      id: id ?? this.id,
    );
  }
}

class Dimension {
  final double meters;
  final double feet;

  Dimension({
    required this.meters,
    required this.feet,
  });

  factory Dimension.fromJson(Map<String, dynamic> json) {
    return Dimension(
      meters: json['meters'] == null ? 0.0 : json['meters'].toDouble(),
      feet: json['feet'] == null ? 0.0 : json['feet'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meters': meters,
      'feet': feet,
    };
  }

  Dimension copyWith({
    double? meters,
    double? feet,
  }) {
    return Dimension(
      meters: meters ?? this.meters,
      feet: feet ?? this.feet,
    );
  }
}

class Mass {
  final int kg;
  final int lb;

  Mass({
    required this.kg,
    required this.lb,
  });

  factory Mass.fromJson(Map<String, dynamic> json) {
    return Mass(
      kg: json['kg'],
      lb: json['lb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kg': kg,
      'lb': lb,
    };
  }

  Mass copyWith({
    int? kg,
    int? lb,
  }) {
    return Mass(
      kg: kg ?? this.kg,
      lb: lb ?? this.lb,
    );
  }
}

class Thrust {
  final double kN;
  final int lbf;

  Thrust({
    required this.kN,
    required this.lbf,
  });

  factory Thrust.fromJson(Map<String, dynamic> json) {
    return Thrust(
      kN: json['kN'] == null ? 0.0 : json['kN'].toDouble(),
      lbf: json['lbf'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'kN': kN,
      'lbf': lbf,
    };
  }

  Thrust copyWith({
    double? kN,
    int? lbf,
  }) {
    return Thrust(
      kN: kN ?? this.kN,
      lbf: lbf ?? this.lbf,
    );
  }
}

class FirstStage {
  final Thrust thrustSeaLevel;
  final Thrust thrustVacuum;
  final bool reusable;
  final int engines;
  final double fuelAmountTons;
  final int? burnTimeSec;

  FirstStage({
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    this.burnTimeSec,
  });

  factory FirstStage.fromJson(Map<String, dynamic> json) {
    return FirstStage(
      thrustSeaLevel: Thrust.fromJson(json['thrust_sea_level']),
      thrustVacuum: Thrust.fromJson(json['thrust_vacuum']),
      reusable: json['reusable'],
      engines: json['engines'],
      fuelAmountTons: json['fuel_amount_tons'].toDouble(),
      burnTimeSec: json['burn_time_sec'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thrust_sea_level': thrustSeaLevel.toJson(),
      'thrust_vacuum': thrustVacuum.toJson(),
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuelAmountTons,
      'burn_time_sec': burnTimeSec,
    };
  }

  FirstStage copyWith({
    Thrust? thrustSeaLevel,
    Thrust? thrustVacuum,
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
  }) {
    return FirstStage(
      thrustSeaLevel: thrustSeaLevel ?? this.thrustSeaLevel,
      thrustVacuum: thrustVacuum ?? this.thrustVacuum,
      reusable: reusable ?? this.reusable,
      engines: engines ?? this.engines,
      fuelAmountTons: fuelAmountTons ?? this.fuelAmountTons,
      burnTimeSec: burnTimeSec ?? this.burnTimeSec,
    );
  }
}

class CompositeFairing {
  final Dimension? height;
  final Dimension? diameter;

  CompositeFairing({
    this.height,
    this.diameter,
  });

  factory CompositeFairing.fromJson(Map<String, dynamic> json) {
    return CompositeFairing(
      height: json['height'] != null ? Dimension.fromJson(json['height']) : null,
      diameter: json['diameter'] != null ? Dimension.fromJson(json['diameter']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'height': height?.toJson(),
      'diameter': diameter?.toJson(),
    };
  }

  CompositeFairing copyWith({
    Dimension? height,
    Dimension? diameter,
  }) {
    return CompositeFairing(
      height: height ?? this.height,
      diameter: diameter ?? this.diameter,
    );
  }
}

class Payloads {
  final CompositeFairing compositeFairing;
  final String option1;

  Payloads({
    required this.compositeFairing,
    required this.option1,
  });

  factory Payloads.fromJson(Map<String, dynamic> json) {
    return Payloads(
      compositeFairing: CompositeFairing.fromJson(json['composite_fairing']),
      option1: json['option_1'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'composite_fairing': compositeFairing.toJson(),
      'option_1': option1,
    };
  }

  Payloads copyWith({
    CompositeFairing? compositeFairing,
    String? option1,
  }) {
    return Payloads(
      compositeFairing: compositeFairing ?? this.compositeFairing,
      option1: option1 ?? this.option1,
    );
  }
}

class SecondStage {
  final Thrust thrust;
  final Payloads payloads;
  final bool reusable;
  final int engines;
  final double fuelAmountTons;
  final int? burnTimeSec;

  SecondStage({
    required this.thrust,
    required this.payloads,
    required this.reusable,
    required this.engines,
    required this.fuelAmountTons,
    this.burnTimeSec,
  });

  factory SecondStage.fromJson(Map<String, dynamic> json) {
    return SecondStage(
      thrust: Thrust.fromJson(json['thrust']),
      payloads: Payloads.fromJson(json['payloads']),
      reusable: json['reusable'],
      engines: json['engines'],
      fuelAmountTons: json['fuel_amount_tons'].toDouble(),
      burnTimeSec: json['burn_time_sec'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'thrust': thrust.toJson(),
      'payloads': payloads.toJson(),
      'reusable': reusable,
      'engines': engines,
      'fuel_amount_tons': fuelAmountTons,
      'burn_time_sec': burnTimeSec,
    };
  }

  SecondStage copyWith({
    Thrust? thrust,
    Payloads? payloads,
    bool? reusable,
    int? engines,
    double? fuelAmountTons,
    int? burnTimeSec,
  }) {
    return SecondStage(
      thrust: thrust ?? this.thrust,
      payloads: payloads ?? this.payloads,
      reusable: reusable ?? this.reusable,
      engines: engines ?? this.engines,
      fuelAmountTons: fuelAmountTons ?? this.fuelAmountTons,
      burnTimeSec: burnTimeSec ?? this.burnTimeSec,
    );
  }
}

class ISP {
  final int seaLevel;
  final int vacuum;

  ISP({
    required this.seaLevel,
    required this.vacuum,
  });

  factory ISP.fromJson(Map<String, dynamic> json) {
    return ISP(
      seaLevel: json['sea_level'],
      vacuum: json['vacuum'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sea_level': seaLevel,
      'vacuum': vacuum,
    };
  }

  ISP copyWith({
    int? seaLevel,
    int? vacuum,
  }) {
    return ISP(
      seaLevel: seaLevel ?? this.seaLevel,
      vacuum: vacuum ?? this.vacuum,
    );
  }
}

class Engines {
  final ISP isp;
  final Thrust thrustSeaLevel;
  final Thrust thrustVacuum;
  final int number;
  final String type;
  final String version;
  final String? layout;
  final int? engineLossMax;
  final String propellant1;
  final String propellant2;
  final double thrustToWeight;

  Engines({
    required this.isp,
    required this.thrustSeaLevel,
    required this.thrustVacuum,
    required this.number,
    required this.type,
    required this.version,
    this.layout,
    this.engineLossMax,
    required this.propellant1,
    required this.propellant2,
    required this.thrustToWeight,
  });

  factory Engines.fromJson(Map<String, dynamic> json) {
    return Engines(
      isp: ISP.fromJson(json['isp']),
      thrustSeaLevel: Thrust.fromJson(json['thrust_sea_level']),
      thrustVacuum: Thrust.fromJson(json['thrust_vacuum']),
      number: json['number'],
      type: json['type'],
      version: json['version'],
      layout: json['layout'],
      engineLossMax: json['engine_loss_max'],
      propellant1: json['propellant_1'],
      propellant2: json['propellant_2'],
      thrustToWeight: json['thrust_to_weight'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isp': isp.toJson(),
      'thrust_sea_level': thrustSeaLevel.toJson(),
      'thrust_vacuum': thrustVacuum.toJson(),
      'number': number,
      'type': type,
      'version': version,
      'layout': layout,
      'engine_loss_max': engineLossMax,
      'propellant_1': propellant1,
      'propellant_2': propellant2,
      'thrust_to_weight': thrustToWeight,
    };
  }

  Engines copyWith({
    ISP? isp,
    Thrust? thrustSeaLevel,
    Thrust? thrustVacuum,
    int? number,
    String? type,
    String? version,
    String? layout,
    int? engineLossMax,
    String? propellant1,
    String? propellant2,
    double? thrustToWeight,
  }) {
    return Engines(
      isp: isp ?? this.isp,
      thrustSeaLevel: thrustSeaLevel ?? this.thrustSeaLevel,
      thrustVacuum: thrustVacuum ?? this.thrustVacuum,
      number: number ?? this.number,
      type: type ?? this.type,
      version: version ?? this.version,
      layout: layout ?? this.layout,
      engineLossMax: engineLossMax ?? this.engineLossMax,
      propellant1: propellant1 ?? this.propellant1,
      propellant2: propellant2 ?? this.propellant2,
      thrustToWeight: thrustToWeight ?? this.thrustToWeight,
    );
  }
}

class LandingLegs {
  final int number;
  final String? material;

  LandingLegs({
    required this.number,
    this.material,
  });

  factory LandingLegs.fromJson(Map<String, dynamic> json) {
    return LandingLegs(
      number: json['number'],
      material: json['material'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'number': number,
      'material': material,
    };
  }

  LandingLegs copyWith({
    int? number,
    String? material,
  }) {
    return LandingLegs(
      number: number ?? this.number,
      material: material ?? this.material,
    );
  }
}

class PayloadWeight {
  final String id;
  final String name;
  final int kg;
  final int lb;

  PayloadWeight({
    required this.id,
    required this.name,
    required this.kg,
    required this.lb,
  });

  factory PayloadWeight.fromJson(Map<String, dynamic> json) {
    return PayloadWeight(
      id: json['id'],
      name: json['name'],
      kg: json['kg'],
      lb: json['lb'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'kg': kg,
      'lb': lb,
    };
  }

  PayloadWeight copyWith({
    String? id,
    String? name,
    int? kg,
    int? lb,
  }) {
    return PayloadWeight(
      id: id ?? this.id,
      name: name ?? this.name,
      kg: kg ?? this.kg,
      lb: lb ?? this.lb,
    );
  }
}