
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';
import '../models/my_team_model.dart';

abstract class IMyTeamDataSource{
  Future<Either<Failure, MyTeamModel>> getMyTeam();

}

class MyTeamDataSource implements IMyTeamDataSource{
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;

  MyTeamDataSource(this._connectivityChecker, this._webServiceConnections);

  @override
  Future<Either<Failure, MyTeamModel>> getMyTeam() async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.getRequest(
          path: API.myTeams,
          showLoader: false,
          useMyPath: false,
        );
        print(response.data.toString());
        print(response.statusCode);

        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              MyTeamModel myTeamModel = MyTeamModel.fromJson(response.data);
              print(myTeamModel.toString());
              return Right(myTeamModel);
            } else {
              print(errorResponseModel.code.toString());
              return Left(Failure(errorResponseModel.code ?? ResponseCode.DEFAULT,
                  errorResponseModel.message ?? ResponseMessage.DEFAULT));
            }

          default:
          // 3.
            print('return Failure with the desired exception');

            return Left(Failure(response.statusCode ?? ResponseCode.DEFAULT,
                response.statusMessage ?? ResponseMessage.DEFAULT));
        }

        // return registerModel;
      } catch (error) {
        print('return Failure $error');

        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

}