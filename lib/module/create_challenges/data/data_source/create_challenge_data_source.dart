

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:global_online/core/utils/services/storage.dart';

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';
import '../../../chat/data/models/all_contact_model.dart';
import '../model/all_team_model.dart';
import '../model/all_users_model.dart';
import '../model/create_challenge_model.dart';

abstract class ICreateChallengeDataSource{
  Future<Either<Failure, AllTeamModel>> getAllTeams();
  Future<Either<Failure, AllUsersModel>> getAllUsers();
  Future<Either<Failure, CreateChallengeModel>> createChallenge(
      String title,
      String? refreeId,
      String? categoryId,
      String? startTime,
      String? endTime,
      String? distance,
      String? stepsNum,
      String? opponentId,
      String? latitude,
      String? longitude,
      String? date
      );

}

class CreateChallengeDataSource implements ICreateChallengeDataSource{
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;

  CreateChallengeDataSource(
      this._connectivityChecker, this._webServiceConnections);

  @override
  Future<Either<Failure, AllTeamModel>> getAllTeams() async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.getRequest(
          path: API.allTeams,
          showLoader: false,
          useMyPath: false,
        );
        print(response.data.toString());
        print(response.statusCode);

        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              AllTeamModel allTeamModel = AllTeamModel.fromJson(response.data);
              print(allTeamModel.toString());
              return Right(allTeamModel);
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
  Future<Either<Failure, CreateChallengeModel>> createChallenge(String title, String? refreeId, String? categoryId, String? startTime, String? endTime, String? distance, String? stepsNum, String? opponentId, String? latitude, String? longitude, String? date) async{

    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: '${API.createChallengeTeam}/${Storage().teamDocument}',
          useMyPath: false,

          data: {
            'title':title,
          if(refreeId !=null)'refree_id':refreeId,
          if(categoryId !=null)'category_id':categoryId,
          if(startTime !=null) 'start_time':startTime,
          if(endTime !=null)  'end_time':endTime,
          if(date !=null)  'date':date,
          if(distance !=null)  'distance':distance,
          if(stepsNum !=null) 'stepsNum':stepsNum,
          if(opponentId !=null)'opponent_id':opponentId,
          if(latitude !=null) 'latitude':latitude,
          if(longitude !=null) 'longitude':longitude,
          },
          showLoader: false,
        );
        print(response.data.toString());
        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              CreateChallengeModel challengeModel =
              CreateChallengeModel.fromJson(response.data);

              return Right(challengeModel);
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

  @override
  Future<Either<Failure, AllUsersModel>> getAllUsers() async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.getRequest(
          path: API.AllUsers,
          showLoader: false,
          useMyPath: false,
        );
        print(response.data.toString());
        print(response.statusCode);

        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              AllUsersModel allUsersModel = AllUsersModel.fromJson(response.data);
              print(allUsersModel.toString());
              return Right(allUsersModel);
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

}