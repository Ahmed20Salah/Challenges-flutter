

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';

abstract class IHomeDataSource{
  Future<Either<Failure, String>> addContact(String phones);
}

class HomeDataSource implements IHomeDataSource{
  final WebServiceConnections _webServiceConnections;
  final IConnectivityChecker _connectivityChecker;

  HomeDataSource(this._webServiceConnections, this._connectivityChecker);

  @override
  Future<Either<Failure, String>> addContact(String phones) async {

    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {

      try {
        Map<String, dynamic>? data = {
        'phones': phones,
        };
        dio.FormData formData = dio.FormData.fromMap(data??{});

        dio.Response response = await _webServiceConnections.postRequest(
          path: API.addContacts,
          // data: {
          //   'phones': phones,
          // },
            object:dio.FormData.fromMap({
              'phones': phones,
            }),
          useObject: true,
          showLoader: false,
          useMyPath: false
        );
        print(response.data.toString());
        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              return Right(response.data['message']);
            } else {
              return Left(Failure(errorResponseModel.code ?? ResponseCode.DEFAULT,
                  errorResponseModel.message ?? ResponseMessage.DEFAULT));
            }

          default:
          // 3. return Failure with the desired exception
            return Left(Failure(response.statusCode ?? ResponseCode.DEFAULT,
                response.statusMessage ?? ResponseMessage.DEFAULT));
        }

        // return registerModel;
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}