

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';
import '../model/healthy_place_model.dart';

abstract class IMapDatasource {
  Future<Either<Failure, HealthyPlaceModel>> getHealthyPlace(String lat,String lang);

}

class MapDataSource implements IMapDatasource{
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;


  MapDataSource(this._connectivityChecker, this._webServiceConnections);

  @override
  Future<Either<Failure, HealthyPlaceModel>> getHealthyPlace(String lat, String lang) async{
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.allHealthyPlaces,
          useMyPath: false,

          data: {'lat': lat, 'lon': lang,


          },
          showLoader: false,
        );
        print(response.data.toString());
        switch (response.statusCode) {
          case 200:
            final errorResponseModel = ErrorResponseModel.fromJson(response.data);
            if (errorResponseModel.code == 200) {
              HealthyPlaceModel healthyPlaceModel =
              HealthyPlaceModel.fromJson(response.data);

              return Right(healthyPlaceModel);
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