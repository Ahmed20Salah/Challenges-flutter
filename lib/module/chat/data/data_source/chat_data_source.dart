import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';
import '../../../../core/utils/image_picker/i_image_file.dart';
import '../models/all_contact_model.dart';
import '../models/create_team_model.dart';

abstract class IChatDataSource {
  Future<Either<Failure, AllContactModel>> allContact();
  Future<Either<Failure, CreateTeamModel>> createTeam(
      {required String name,
      IImageFile? avatarTeam,
      required String userFirebaseUid});
  Future<Either<Failure, String>> newContact(
      String firstName, String lastName, String phone);
}

class ChatDataSource implements IChatDataSource {
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;

  ChatDataSource(this._connectivityChecker, this._webServiceConnections);

  @override
  Future<Either<Failure, AllContactModel>> allContact() async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.getRequest(
          path: API.getContact,
          showLoader: false,
          useMyPath: false,
        );
        print(response.data.toString());
        print(response.statusCode);

        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              AllContactModel myContactModel =
                  AllContactModel.fromJson(response.data);
              print(myContactModel.toString());
              return Right(myContactModel);
            } else {
              print(errorResponseModel.code.toString());
              print('return Failure with the desired exception');
              return Left(Failure(
                  errorResponseModel.code ?? ResponseCode.DEFAULT,
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
  Future<Either<Failure, CreateTeamModel>> createTeam(
      {required String name,
      IImageFile? avatarTeam,
      required String userFirebaseUid}) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.createTeam,
          useMyPath: false,
          data: {'name': name, 'user_firebase_uid': userFirebaseUid},
          file: avatarTeam,
          showLoader: false,
        );
        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              CreateTeamModel updateProfileModel =
                  CreateTeamModel.fromJson(response.data);

              return Right(updateProfileModel);
            } else {
              return Left(Failure(
                  errorResponseModel.code ?? ResponseCode.DEFAULT,
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
  Future<Either<Failure, String>> newContact(
      String firstName, String lastName, String phone) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.newContact,
          useMyPath: false,
          data: {
            'First-Name': firstName,
            'Last-Name': lastName,
            'phone': phone
          },
          showLoader: false,
        );
        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              // CreateTeamModel updateProfileModel =
              // CreateTeamModel.fromJson(response.data);

              return Right(errorResponseModel.message ?? '');
            } else {
              return Left(Failure(
                  errorResponseModel.code ?? ResponseCode.DEFAULT,
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
