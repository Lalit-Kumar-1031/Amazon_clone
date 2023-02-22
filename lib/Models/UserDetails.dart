class UserDetailsModel
{
  final String name;
  final String address;
  UserDetailsModel({required this.name,required this.address});

  Map<String ,dynamic> getJson(){
    return
      {
        "Name":name,
        "Address":address,
     };
  }

}