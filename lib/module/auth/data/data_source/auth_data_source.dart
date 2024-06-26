import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/netwrok/failure.dart';
import 'package:global_online/core/utils/connectivity_check/i_connectivity_checker.dart';
import 'package:global_online/module/auth/data/models/register_model.dart';

import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../models/login_model.dart';

abstract class IAuthDataSource {
  Future<Either<Failure, RegisterModel>> register(
      {required String name,
      required String email,
      required String password,
      required String confirmPassword,
      required String phone,
      required String firebaseUid});
  Future<Either<Failure, LoginModel>> login(String uid);

  Future<Either<Failure, bool>> verfiyAccountExistance(
      {required String phone, required String email});
}

class AuthDataSource implements IAuthDataSource {
  final WebServiceConnections _webServiceConnections;
  final IConnectivityChecker _connectivityChecker;

  AuthDataSource(this._webServiceConnections, this._connectivityChecker) {
    print('AuthDataSource Instance');
  }

  @override
  Future<Either<Failure, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String firebaseUid,
  }) async {
    // bool isConnected = await _connectivityChecker.isConnected();
    // if (isConnected) {
    //   print({
    //     'name': name,
    //     'phone': phone,
    //     'email': email,
    //     'password': password,
    //     'confirm_password': confirmPassword,
    //     "firebase_uid": firebaseUid
    //   });
    try {
      Response response = await _webServiceConnections.postRequest(
        path: API.register,
        data: {
          'name': name,
          'phone': phone,
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
          "firebase_uid": firebaseUid
        },
        showLoader: true,
      );
      print(response.data.toString());
      print(response.statusCode.toString());
      switch (response.statusCode) {
        case 200:
          final errorResponseModel = ErrorResponseModel.fromJson(response.data);
          if (errorResponseModel.code == 200) {
            RegisterModel registerModel = RegisterModel.fromJson(response.data);

            return Right(registerModel);
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
    // } else {
    //   return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    // }
  }

  @override
  Future<Either<Failure, LoginModel>> login(String uid) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.login,
          data: {
            'uid': uid,
          },
          showLoader: true,
        );
        print(response.data.toString());
        print(response.statusCode.toString());
        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              LoginModel registerModel = LoginModel.fromJson(response.data);

              return Right(registerModel);
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
  Future<Either<Failure, bool>> verfiyAccountExistance(
      {required String phone, required String email}) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (true) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.checkUserExist,
          data: {
            'email': email,
            'phone': phone,
          },
          showLoader: true,
        );
        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              return const Right(true);
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
