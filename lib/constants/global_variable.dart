String KbaseUrl = "http://192.168.1.12:4000/ypc-chef-micro-service";

String UploadVideoLocal ="http://192.168.1.12:4000/ypc-authentication-micro-service/uploadVideolocal";
String node = "http://1192.168.1.12:4000/uploads/";

String getbaseUrl = "http://192.168.1.12:4000/ypc-authentication-micro-service";


Map<String, String> Kheader = {
      'Content-Type': 'application/json; charset=UTF-8',
      "application-name" :"ypc.chef",
      "auth-key" :"DA2C5T3MCWVJDKMIZ6VO",
    };
// for sessiontoken
String ksessionUrl = "http://192.168.1.12:4000/ypc-chef-micro-service";




Map<String, String> headerwithusertoken = {
      'Content-Type': 'application/json; charset=UTF-8',
      "application-name" :"ypc.chef",
      "auth-key" :"DA2C5T3MCWVJDKMIZ6VO",
    };