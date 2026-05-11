class Product {
  String? status;
  Meta? meta;
  List<Data>? data;

  Product({this.status, this.meta, this.data});

  Product.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Meta {
  String? title;
  String? description;
  String? copyright;
  String? generated;
  int? count;

  Meta({
    this.title,
    this.description,
    this.copyright,
    this.generated,
    this.count,
  });

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    copyright = json['copyright'];
    generated = json['generated'];
    count = json['count'];
  }
}

class Data {
  int? id;
  String? name;
  String? tagline;
  String? description;
  String? price;
  String? currency;
  String? image;
  Specs? specs;

  Data({
    this.id,
    this.name,
    this.tagline,
    this.description,
    this.price,
    this.currency,
    this.image,
    this.specs,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    tagline = json['tagline'];
    description = json['description'];
    price = json['price'];
    currency = json['currency'];
    image = json['image'];
    specs = json['specs'] != null ? Specs.fromJson(json['specs']) : null;
  }
}

List<Data> cartItems = [];

class Specs {
  String? chip;
  String? material;
  String? camera;
  String? display;
  String? battery;
  String? ports;
  String? weight;
  String? design;
  String? colors;
  String? screen;
  String? pencil;
  String? connectivity;
  String? caseType;
  String? brightness;
  String? gps;
  String? feature;
  String? carbon;
  String? os;
  String? control;
  String? audio;
  String? driver;
  String? cancellation;
  String? materials;
  String? home;
  String? sensing;
  String? size;

  Specs({
    this.chip,
    this.material,
    this.camera,
    this.display,
    this.battery,
    this.ports,
    this.weight,
    this.design,
    this.colors,
    this.screen,
    this.pencil,
    this.connectivity,
    this.caseType,
    this.brightness,
    this.gps,
    this.feature,
    this.carbon,
    this.os,
    this.control,
    this.audio,
    this.driver,
    this.cancellation,
    this.materials,
    this.home,
    this.sensing,
    this.size,
  });

  Specs.fromJson(Map<String, dynamic> json) {
    chip = json['chip'];
    material = json['material'];
    camera = json['camera'];
    display = json['display'];
    battery = json['battery'];
    ports = json['ports'];
    weight = json['weight'];
    design = json['design'];
    colors = json['colors'];
    screen = json['screen'];
    pencil = json['pencil'];
    connectivity = json['connectivity'];
    caseType = json['case'];
    brightness = json['brightness'];
    gps = json['gps'];
    feature = json['feature'];
    carbon = json['carbon'];
    os = json['os'];
    control = json['control'];
    audio = json['audio'];
    driver = json['driver'];
    cancellation = json['cancellation'];
    materials = json['materials'];
    home = json['home'];
    sensing = json['sensing'];
    size = json['size'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chip'] = chip;
    data['material'] = material;
    data['camera'] = camera;
    data['display'] = display;
    data['battery'] = battery;
    data['ports'] = ports;
    data['weight'] = weight;
    data['design'] = design;
    data['colors'] = colors;
    data['screen'] = screen;
    data['pencil'] = pencil;
    data['connectivity'] = connectivity;
    data['case'] = caseType;
    data['brightness'] = brightness;
    data['gps'] = gps;
    data['feature'] = feature;
    data['carbon'] = carbon;
    data['os'] = os;
    data['control'] = control;
    data['audio'] = audio;
    data['driver'] = driver;
    data['cancellation'] = cancellation;
    data['materials'] = materials;
    data['home'] = home;
    data['sensing'] = sensing;
    data['size'] = size;
    return data;
  }
}
