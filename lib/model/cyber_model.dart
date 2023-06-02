
class CyberModel{
  String? title;
  String? subTitle;
  String? explanation;
  String? id;

  CyberModel({this.title,this.explanation,this.subTitle});

  CyberModel.fromJson(Map<String, dynamic> json){

    title = json['title']?? '';
    subTitle = json['subTitle']??'';
    explanation = json['explanation']??'';
    id = json['id'];

  }

  toJson(){
    Map<String,dynamic> json ={};
    json['title'] = title;
    json['subTitle'] = subTitle;
    json['explanation'] = explanation;

    return json;
  }
}