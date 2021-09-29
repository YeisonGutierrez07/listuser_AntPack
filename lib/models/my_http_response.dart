/*
se crea MyHttpResponse para el manejo de respuestas
de una manera mas organizada para tener un mejor 
control
*/

class MyHttpResponse {
  int? statusCode;
  String message;
  dynamic data;

  MyHttpResponse(this.statusCode, this.data, {this.message = ""});

  @override
  String toString() {
    return 'MyHttpResponse{statusCode: $statusCode, message: $message, data: $data}';
  }
}
