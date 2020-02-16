class JobModel {
//  Field
  String id, category, name, year, pathVideo, pathImage;

//  Method
  JobModel(this.id, this.category, this.name, this.year, this.pathVideo,
      this.pathImage);

  JobModel.fromMap(Map<String, dynamic> map){
    id = map['id'];
    category = map['Category'];
    name = map['Name'];
    year = map['Year'];
    pathVideo = map['PathVideo'];
    pathImage = map['PathImage'];
  }


}
