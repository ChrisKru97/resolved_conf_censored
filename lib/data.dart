import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PointOfProgram {
  String name;
  String place;
  String theme;
  SpeakerOfConf speaker;
  NonSpeakerOfConf nonspeaker;
  TimeOfDay startTime;
  TimeOfDay endTime;
  int marker;
  String description;
  int id;

  PointOfProgram(this.name, this.startTime,
      {this.endTime,
      this.speaker,
      this.place,
      this.theme,
      this.nonspeaker,
      this.marker,
      this.description,
      this.id});
}

class DateOfConf {
  DateTime day;
  List<PointOfProgram> program;

  DateOfConf(this.day, this.program);
}

class SpeakerOfConf {
  int id;
  String name;
  String description;
  String url;

  SpeakerOfConf(this.id, this.name, this.description, {this.url});
}

class NonSpeakerOfConf {
  int id;
  String name;
  String description;

  NonSpeakerOfConf(this.id, this.name, {this.description});
}

class Contact {
  String number;
  String name;
  String function;
  bool inTime;
  TimeOfDay startTime;
  TimeOfDay endTime;
  DateTime day;

  Contact(this.function, this.name, this.number,
      {this.inTime, this.startTime, this.endTime, this.day});
}

List<Contact> contacts = <Contact>[
  Contact('Registrace', 'M. N.', '+420censored'),
  Contact('Klíče fara, kanaan', 'M. P.', '+420censored'),
  Contact('Klíče škola', 'M. M.', '+420censored',
      inTime: false,
      startTime: TimeOfDay(hour: 6, minute: 0),
      endTime: TimeOfDay(hour: 20, minute: 0),
      day: DateTime(2019, 10, 12)),
  Contact('Klíče škola', 'Ch. K.', '+420censored',
      inTime: true,
      startTime: TimeOfDay(hour: 6, minute: 0),
      endTime: TimeOfDay(hour: 20, minute: 0),
      day: DateTime(2019, 10, 12)),
  Contact('Zdravotník', 'A. B.', '+420censored',
      inTime: true,
      startTime: TimeOfDay(hour: 14, minute: 0),
      endTime: TimeOfDay(hour: 16, minute: 30),
      day: DateTime(2019, 10, 12)),
  Contact('Zdravotník', 'D. Sz.', '+420censored',
      inTime: false,
      startTime: TimeOfDay(hour: 14, minute: 0),
      endTime: TimeOfDay(hour: 16, minute: 30),
      day: DateTime(2019, 10, 12)),
];

List<SpeakerOfConf> speakers = <SpeakerOfConf>[
  SpeakerOfConf(0, 'M. D.', 'M........', url: 'http://bskk.cz/kazani/'),
  SpeakerOfConf(1, 'J. K.', 'J........'),
  SpeakerOfConf(2, 'D. S.', 'D........'),
  SpeakerOfConf(3, 'M. T.', 'M........'),
  SpeakerOfConf(4, 'Š. R.', 'S........'),
  SpeakerOfConf(5, 'B. T.', 'B........',
      url: 'http://bystrice.sceav.cz/archiv-bohosluzeb/'),
  SpeakerOfConf(6, 'B. T.', 'B........',
      url: 'https://www.youtube.com/channel/UCyPvOaWywk6mXqwxLxVj7iQ/videos')
];

List<NonSpeakerOfConf> unlisted = <NonSpeakerOfConf>[
  NonSpeakerOfConf(1, 'Americké evangelium')
];

Set<Marker> markers = <Marker>{
  Marker(
    position: LatLng(49.638195, 18.725584),
    infoWindow: InfoWindow(
      title: 'Kostel',
    ),
    icon: BitmapDescriptor.defaultMarker,
    markerId: MarkerId("0"),
  ),
  Marker(
    position: LatLng(49.637549, 18.725251),
    infoWindow: InfoWindow(title: 'Kanaan', snippet: 'Mercy Cafe, WC, jidelna'),
    icon: BitmapDescriptor.defaultMarker,
    markerId: MarkerId("1"),
  ),
  Marker(
    position: LatLng(49.637824, 18.725750),
    infoWindow: InfoWindow(title: 'Fara', snippet: 'Jidelna, WC'),
    icon: BitmapDescriptor.defaultMarker,
    markerId: MarkerId("2"),
  ),
  Marker(
    position: LatLng(49.636902, 18.719823),
    infoWindow: InfoWindow(title: 'Obchod', snippet: 'Tesco'),
    icon: BitmapDescriptor.defaultMarker,
    markerId: MarkerId("3"),
  ),
  Marker(
    position: LatLng(49.639130, 18.721473),
    infoWindow: InfoWindow(title: 'Hala', snippet: 'Volejbal'),
    icon: BitmapDescriptor.defaultMarker,
    markerId: MarkerId("4"),
  ),
};

List<PointOfProgram> pointsWithDesc = [
  PointOfProgram('Večerní program', TimeOfDay(hour: 17, minute: 30),
      speaker: speakers.elementAt(0),
      place: 'Kostel',
      marker: 0,
      theme: 'Základy k posvěcení',
      id: 0,
      description:
          'Svatost nezačíná u nás, ale u Boha. Když se díváme na Něho, jasně vidíme, kdo je Bůh a proč musíme usilovat o posvěcení a svatost.'),
  PointOfProgram('Přednáška', TimeOfDay(hour: 20, minute: 30),
      place: 'Kostel',
      marker: 0,
      theme: 'Svatost',
      speaker: speakers.elementAt(0),
      id: 1,
      description:
          'Skrze tento žalm budeme hodnotit, v čem hledáme radost a budeme se učit o tajemství, o kterém málo kdo ví: pokud chceš být šťastný, musíš být svatý.'),
  PointOfProgram('Dopolední program', TimeOfDay(hour: 8, minute: 30),
      speaker: speakers.elementAt(1),
      theme: 'Eschatologie',
      place: 'Kostel',
      marker: 0,
      id: 2,
      description:
          'Eschatologie je nauka o posledních věcech. Seminář má za cíl základní orientaci v této problematice a zaměří se na dvě konkrétní pasáže z Písma:na učení Pána Ježíše o posledních věcech z Mat. 24 a Pavlovo učení z 2 Tes 2. V těchto textech se píše o druhém příchodu Ježíše Krista, o předpovědi zkázy chrámu a o velkém soužení. Jak se v těchto věcech orientovat a jak být připraven na druhý příchod?'),
  PointOfProgram('Seminář 1', TimeOfDay(hour: 10, minute: 30),
      speaker: speakers.elementAt(2),
      place: 'Kostel',
      marker: 0,
      theme: 'Překážky, které brání v pravé zbožnosti',
      id: 3,
      description:
          'Pravé zbožnosti mohou bránit dvě základní věci:\n1) nedostatek povědomí o tom, jak má pravá zbožnost vypadat\n2) nedostatek síly realizovat poznanou Boží vůli ohledně našeho posvěcení. Tento druhý nedostatek může být způsoben různými faktory: lenost, strach, špatné vzory… Ať je to cokoli, svou sílu můžeme čerpat od Pána, z jeho veliké moci.'),
  PointOfProgram('Seminář 2', TimeOfDay(hour: 10, minute: 30),
      speaker: speakers.elementAt(3),
      place: 'Kanaan',
      marker: 1,
      theme: 'Půst, Nehodnost',
      id: 4,
      description:
          'Půst je jednou z nejobávanějších a nejvíce nepochopených duchovních disciplín. Má to co do činění s tím, že se o něm málo mluví, píše nebo káže. Ježíš přitom od svých následovníků očekává, že se budou postit. Na tomto semináři se podíváme na to, co je to půst, jaké jsou druhy půstu a především, jaký může mít půst účel, což souvisí i s naší nehodností. Můžeme se také sdílet s osobními zkušenostmi s půstem. Zváni jsou všichni, kdo se nebojí zakusit požehnání, které půst přináší.'),
  PointOfProgram('Seminář 3', TimeOfDay(hour: 10, minute: 30),
      speaker: speakers.elementAt(0),
      place: 'Fara',
      marker: 2,
      theme: 'Sedm povinností k posvěcení',
      id: 5,
      description:
          'Někteří lidé vlastní zbraň, ale mnohdy neví, jak ji mají používat v sebeobraně. Podobně mnoho lidí má Bibli, ale neví, jak ji používat v procesu posvěcení. Bůh nám ve své moudrosti dal instrukce přímo v Písmu, aby nás učil, jak úspěšně používat Jeho Slovo v procesu posvěcení.'),
  PointOfProgram('Odpolední program', TimeOfDay(hour: 17, minute: 30),
      place: 'Kostel',
      marker: 0,
      theme: 'Boží svrchovanost a lidská zodpovědnost v otázce posvěcení',
      speaker: speakers.elementAt(4),
      id: 6,
      description:
          'Zatímco při spasení člověka je to Bůh, který v Kristu skrze svou svrchovanou milost člověka zachraňuje, ospravedlňuje a přináší nový život a člověk z důvodu svého duchovního stavu nemůže s Bohem na svém spasení nijak spolupracovat, v posvěcení je spolupráce člověka s Bohem nutná. Podstatou posvěcení je, že skrze Boží milost se postupně stáváme tím, čím už v Kristu dokonale jsme. Božská moc nám darovala všecko, čeho je třeba k zbožnému životu (2. list Petrův 1,3). Jeho zaslíbení jsou určena k tomu, abychom měli účast na božské přirozenosti a unikli zhoubě. Za tímto účelem je nutné nejen každodenní umrtvování naší staré přirozenosti („starého Adama“), ale také oblékání nového člověka (Koloským 3,5-10). V tomto procesu je nutné vynaložit všechnu snahu a budovat křesťanské vlastnosti, jako víra, ctnost, poznání, zdrženlivost, trpělivost, zbožnost, bratrskou náklonnost a lásku (2. list Petrův 1,5-7). Tyto vlastnosti jsou garancí, že nezůstaneme v křesťanském životě nečinní, ale budeme přinášet ovoce pro Boží království.'),
  PointOfProgram('Bohoslužby', TimeOfDay(hour: 10, minute: 30),
      speaker: speakers.elementAt(5),
      place: 'Kostel',
      marker: 0,
      id: 7,
      description:
          'K čemu slouží posvěcení? Je to způsob, jak si zasloužit spasení? Je posvěcený život stavem, za který bychom mohli být na sebe pyšní? Opravňuje mě moje vysoká úroveň posvěcení k tomu, abych se porovnával s ostatními nebo odsuzoval ostatní lidi? Jaký je pravý smysl a cíl posvěcení v našem životě? O tom budeme přemýšlet právě v neděli dopoledne.'),
  PointOfProgram('Biblická hodina', TimeOfDay(hour: 16, minute: 0),
      speaker: speakers.elementAt(6),
      place: 'Fara',
      marker: 2,
      theme: 'Posvěcení jako naplnění života',
      id: 8,
      description:
          'Ospravedlnění a posvěcení – v čem se liší? Oblasti života křesťana, kterých se posvěcení týká. Mám to v kapse? Kdy to budu mít?'),
];

List<DateOfConf> program = [
  DateOfConf(DateTime(2019, 10, 11), <PointOfProgram>[
    PointOfProgram(
      'Registrace',
      TimeOfDay(hour: 15, minute: 0),
    ),
    PointOfProgram('Zahájení', TimeOfDay(hour: 17, minute: 0),
        place: 'Kostel', marker: 0),
    pointsWithDesc.elementAt(0),
    PointOfProgram(
      'Večeře',
      TimeOfDay(hour: 19, minute: 15),
      place: 'Fara, kanaan',
      marker: 2,
    ),
    PointOfProgram(
      'Film “Americké evangelium”',
      TimeOfDay(hour: 20, minute: 30),
      place: 'Fara',
      marker: 2,
      nonspeaker: unlisted.elementAt(0),
    ),
    pointsWithDesc.elementAt(1)
  ]),
  DateOfConf(DateTime(2019, 10, 12), <PointOfProgram>[
    PointOfProgram(
      'Snídaně',
      TimeOfDay(hour: 7, minute: 30),
      place: 'Fara, kanaan',
      marker: 2,
    ),
    pointsWithDesc.elementAt(2),
    pointsWithDesc.elementAt(3),
    pointsWithDesc.elementAt(4),
    pointsWithDesc.elementAt(5),
    PointOfProgram(
      'Oběd',
      TimeOfDay(hour: 12, minute: 15),
      place: 'Fara, kanaan',
      marker: 2,
    ),
    PointOfProgram(
      'Fotbal',
      TimeOfDay(hour: 14, minute: 0),
      place: 'Nýdek',
    ),
    PointOfProgram(
      'Volejbal',
      TimeOfDay(hour: 14, minute: 0),
      place: 'Hala',
      marker: 4,
    ),
    PointOfProgram(
      'Diskuzní fórum',
      TimeOfDay(hour: 14, minute: 0),
      place: 'Fara',
      marker: 2,
    ),
    pointsWithDesc.elementAt(6),
    PointOfProgram(
      'Večeře',
      TimeOfDay(hour: 18, minute: 30),
      place: 'Fara, kanaan',
      marker: 2,
    ),
    PointOfProgram(
      'Panelová diskuze',
      TimeOfDay(hour: 20, minute: 0),
      place: 'Kostel',
      marker: 0,
      theme: 'Duchovní rozlišování, praktické zbožnost mladého křesťana',
    ),
    PointOfProgram(
      'Modlitební výšlap',
      TimeOfDay(hour: 23, minute: 0),
    ),
  ]),
  DateOfConf(DateTime(2019, 10, 13), <PointOfProgram>[
    PointOfProgram(
      'Snídaně',
      TimeOfDay(hour: 7, minute: 30),
      place: 'Fara, kanaan',
      marker: 2,
    ),
    pointsWithDesc.elementAt(7),
    PointOfProgram(
      'Oběd',
      TimeOfDay(hour: 12, minute: 15),
      place: 'Fara, kanaan',
      marker: 2,
    ),
    pointsWithDesc.elementAt(8)
  ])
];
