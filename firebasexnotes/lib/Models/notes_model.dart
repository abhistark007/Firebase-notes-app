class Notes{
  final String txt;
  Notes({required this.txt});

  Map<String,dynamic> toMap(Notes notes)=>{"goals":notes.txt};


}