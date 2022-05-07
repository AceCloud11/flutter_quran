import 'package:flutter/material.dart';

class Source {
  late String name;
  late String src;
  String img = "assets/images/qtm.jpg";

  Source(this.name, this.src);
}

List sources = [
  Source('Al-Fatihah', "001.mp3"),
  Source('Al-Baqarah', "002.mp3"),
  Source('Al-Imran', "003.mp3"),
  Source('An-Nisa', "004.mp3"),
  Source('Al-Ma\'idah', "005.mp3"),
  Source('Al-An\'am', "006.mp3"),
  // Source('Al-A\'raf', "007.mp3"),
  // Source('Al-Anfal', "008.mp3"),
  // Source('At-Taubah', "009.mp3"),
  // Source('Yunus', "010.mp3"),
  // Source('Hood', "012.mp3"),
  // Source('Yusuf', "012.mp3"),
  // Source('Ar-Ra\'d', "013.mp3"),
  // Source('Ibrahim', "014.mp3"),
  // Source('Al-Hijr', "015.mp3"),
  // Source('An-Nahl', "016.mp3"),
  // Source('Al-Isra', "017.mp3"),
  // Source('Al-Kahf', "018.mp3"),
  // Source('Maryam', "019.mp3"),
  // Source('Ta­Ha', "020.mp3"),
  // Source('Surat Al-Anbya', "021.mp3"),
  // Source('Surat Al-Haj', "022.mp3"),
  // Source('Surat Al-Mu\'minun', "023.mp3"),
  // Source('Surat An-Nur', "024.mp3"),
  // Source('Surat Al-Furqan', "025.mp3"),
  // Source('Surat Ash-Shu\'ara', "026.mp3"),
  // Source('Surat An-Naml', "027.mp3"),
  // Source('Surat Al-Qasas', "028.mp3"),
  // Source('Surat Al-Ankabut', "029.mp3"),
  // Source('Surat Ar-Rum', "030.mp3"),
  // Source('Surat Luqmaan', "031.mp3"),
  // Source('Surat As-Sajdah', "032.mp3"),
  // Source('Surat Al-Ahzaab', "033.mp3"),
  // Source('Surat Saba', "034.mp3"),
  // Source('Surat Faatir', "035.mp3"),
  // Source('Surat Ya-Sin', "036.mp3"),
  // Source('Surat As-Saaffaat', "037.mp3"),
  // Source('Surat Saad', "038.mp3"),
  // Source('Surat Az-Zumar', "039.mp3"),
  // Source('Surat Ghafir', "040.mp3"),
];
