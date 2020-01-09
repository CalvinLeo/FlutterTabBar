import 'package:dio/dio.dart';

class HttpClient {
  static final String GET = "get";
  static final String POST = "post";
  static final String DATA = "data";
  static final String CODE = "errorCode";

  // 工厂方法
  factory HttpClient() => _getInstance();
  static HttpClient get instance => _getInstance();
  static HttpClient _instance;
  Dio dio;

  HttpClient._internal() {
    // 初始化
    dio = Dio(BaseOptions(
      headers: {'platform': 'ios', 'version': '1.0.0'},
      sendTimeout: 5000,
      receiveTimeout: 5000,
    ));
  }

  static HttpClient _getInstance() {
    if (_instance == null) {
      _instance = HttpClient._internal();
    }
    return _instance;
  }

  // get 请求 可选命名参数，用 {} 包裹 
  get(
    String urlStr, { 
    Map<String, dynamic> params, 
    Function successCallBack,
    Function errorCallBask,
  }) async {
    _requestHttp(urlStr, GET, params, successCallBack, errorCallBask);
  }

  // 请求方法
  _requestHttp(
    String urlStr,
    String method,
    Map<String, dynamic> params, 
    Function successCallBack, 
    Function errorCallBack,
  ) async {
    String msg = "";
    int code;

    try {
      Response response;
      _addStartHttpInterceptor(dio); //添加请求之前的拦截器
      if (method == GET) {
        if (params != null && params.isNotEmpty) {
          response = await dio.get(urlStr, queryParameters: params);
        } else {
          response = await dio.get(urlStr);
        }
      } else if (method == POST) {
        if (params != null && params.isNotEmpty) {
          response = await dio.post(urlStr, data: params);
        } else {
          response = await dio.post(urlStr);
        }
      }

      // respose 处理
      code = response.statusCode;
      msg = 'success';
      if (code == 200) {
        if (successCallBack != null) 
          successCallBack(code, msg, response.data);
      }
      else {
        msg = '错误码：' + code.toString() + '，' + response.data.toString();
        if (errorCallBack != null)
          errorCallBack(code, msg);
        // _error(errorCallBack, errorMsg);
        // return;
      }

      // String dataStr = json.encode(response.data);
      // Map<String, dynamic> dataMap = json.decode(dataStr);
      // if (dataMap != null && dataMap[CODE] != 0) {
      //   errorMsg =
      //       '错误码：' + dataMap[CODE].toString() + '，' + response.data.toString();
      //   _error(errorCallBack, errorMsg);
      //   return;
      // }

      if (successCallBack != null) {
        // successCallBack(dataMap[DATA]);
      }
    } catch (exception) {
      _error(errorCallBack, exception.toString());
    }
  }

  // 错误处理
  _error(Function errorCallBack, String error) {
    // Fluttertoast.showToast(
    //     msg: error.toString(),
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER);
    if (errorCallBack != null) {
      errorCallBack(error);
    }
  }

  // 拦截
  _addStartHttpInterceptor(Dio dio) {
    // dio.interceptors.request.onSend = (Options options) {
    //   // 在请求被发送之前做一些事情   比如加密的一些操作 或者添加token等参数 对head 或者请求参数进行加工处理
    //   Map<String, dynamic> headers = options.headers;
    //   Map<String, dynamic> body = options.data;
    //   /*request['token'] = '1111111111';
    //   headers['addParam'] = 'aaaaaaaaaaaaaaa';*/
    //   return options;
    // };
  }
}
