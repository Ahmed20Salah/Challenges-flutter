


import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:global_online/core/config/apis/config_api.dart';

import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';
import '../models/challenge_details_model.dart';

abstract class IChallengeDetailsDataSource{
  Future<Either<Failure, ChallengeDetailsModel>> getChallengesDetails(String  id);
  Future<Either<Failure, String>> resultChallenge(String teamId, String challengeId,String? footballResultData,String? userId,String? resultData,String? opponentResult);

}

class ChallengeDetailsDataSource implements IChallengeDetailsDataSource{
  final WebServiceConnections _webServiceConnections;
  final IConnectivityChecker _connectivityChecker;

  ChallengeDetailsDataSource(
      this._webServiceConnections, this._connectivityChecker);

  @override
  Future<Either<Failure, ChallengeDetailsModel>> getChallengesDetails(String  id) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.getRequest(
          path: '${API.challengeDetails}/$id',
          showLoader: false,
          useMyPath: false,
        );
        print(response.data.toString());
        print(response.statusCode);

        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              ChallengeDetailsModel challengeDetailsModel = ChallengeDetailsModel.fromJson(response.data);
              print(challengeDetailsModel.toString());
              return Right(challengeDetailsModel);
            } else {
              print(errorResponseModel.code.toString());
              print('return Failure with the desired exception');
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

  @override
  Future<Either<Failure, String>> resultChallenge(String teamId, String challengeId,String? footballResultData,String? userId,String? resultData,String? opponentResult) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: '${API.challengeResult}/${challengeId}/${teamId}',
          useMyPath: false,

          data: {
            if(footballResultData !=null)'football_result_data':footballResultData,
            if(userId !=null)'user_id':userId,
            if(resultData !=null)'result_data':resultData,
            if(opponentResult !=null) 'opponent_result':opponentResult,
          },
          showLoader: false,
        );
        print(response.data.toString());
        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              // CreateChallengeModel challengeModel =
              // CreateChallengeModel.fromJson(response.data);

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