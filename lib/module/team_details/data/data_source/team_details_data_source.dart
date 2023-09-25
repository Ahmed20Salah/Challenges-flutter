

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:global_online/core/config/apis/config_api.dart';

import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';
import '../model/team_details_model.dart';

abstract class ITeamDetailsDataSource {
  Future<Either<Failure, TeamDetailsModel>> getTeamDetails(String id);
}


class TeamDetailsDataSource implements ITeamDetailsDataSource{
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;

  TeamDetailsDataSource(this._connectivityChecker, this._webServiceConnections);

  @override
  Future<Either<Failure, TeamDetailsModel>> getTeamDetails(String id) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.getRequest(
          path: '${API.viewTeam}/$id',
          showLoader: false,
          useMyPath: false,
        );
        print(response.data.toString());
        print(response.statusCode);

        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              TeamDetailsModel teamDetailsModel = TeamDetailsModel.fromJson(response.data);
              print(teamDetailsModel.toString());
              return Right(teamDetailsModel);
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