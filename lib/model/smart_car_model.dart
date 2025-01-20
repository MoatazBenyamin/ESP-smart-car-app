class SmartCarModel
{
  final int A2RedIr;
  final int A3GreenIr;
  final int A5BlueIr;
  final int returnir;
  final int nearestir;
  final String find;

  bool red= false;
  bool green= false;
  bool blue= false;

  SmartCarModel(
    {
      required this.A2RedIr,
       required this.A3GreenIr,
        required this.A5BlueIr,
        required this.returnir,
        required this.nearestir,
        required this.find,
        });
        factory SmartCarModel.fromJson(Map<String, dynamic> json)
        {
          return SmartCarModel
          (
            returnir: json['returnir'],
            A2RedIr: json['redir'],
            A3GreenIr: json['greenir'],
            A5BlueIr: json['blueir'],
            nearestir: json['nearestir'],
            find: json['find']
            );
        }
    void turnToFlag()
    {
      if(A2RedIr==1)red=true;
      else red=false;
      if(A3GreenIr==1)green=true;
      else green=false;
      if(A5BlueIr==1)blue=true;
      else blue =false;
    }
    Map<String, dynamic> toJson()
    {
      return 
      {
        'redir':A2RedIr,
        'greenir':A3GreenIr,
        'blueir': A5BlueIr,
      };
    }
}