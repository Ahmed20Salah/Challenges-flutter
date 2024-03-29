import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';

abstract class IContactUsDataSource {
  Future<Either<Failure, bool>> sendMessage(Map<String, dynamic> data);
}

class ContactUsDataSource implements IContactUsDataSource {
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;

  ContactUsDataSource(this._connectivityChecker, this._webServiceConnections);
  @override
  Future<Either<Failure, bool>> sendMessage(Map<String, dynamic> data) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.contactUs,
          useMyPath: false,
          data: data,
          showLoader: true,
        );

        print(response.statusCode);
        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);

            if (errorResponseModel.code == 200 ||
                errorResponseModel.code == 201) {
              return const Right(true);
            } else {
              return Left(Failure(
                  errorResponseModel.code ?? ResponseCode.DEFAULT,
                  errorResponseModel.message ?? ResponseMessage.DEFAULT));
            }

          case 201:
            return const Right(true);
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
