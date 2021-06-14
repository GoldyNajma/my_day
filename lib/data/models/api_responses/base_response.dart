abstract class BaseResponse<DataType, MessageType> {
  final DataType? data;
  final MessageType message;
  final int statusCode;

  BaseResponse({
    this.data, 
    required this.message, 
    required this.statusCode
  });
}