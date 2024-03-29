import 'dart:convert';
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:global_online/module/blogs/data/data_source/models/blog.dart';

import '../../../../core/config/apis/config_api.dart';
import '../../../../core/errors/error_response_model.dart';
import '../../../../core/errors/handle_error.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/netwrok/web_connection.dart';
import '../../../../core/utils/connectivity_check/i_connectivity_checker.dart';

abstract class IBlogsDataSource {
  Future<Either<Failure, List<BlogModel>>> getBlogs(String? word);
}

class BlogsDataSource implements IBlogsDataSource {
  final IConnectivityChecker _connectivityChecker;
  final WebServiceConnections _webServiceConnections;

  BlogsDataSource(this._connectivityChecker, this._webServiceConnections);
  @override
  Future<Either<Failure, List<BlogModel>>> getBlogs(String? word) async {
    bool isConnected = await _connectivityChecker.isConnected();
    if (isConnected) {
      try {
        Response response = await _webServiceConnections.postRequest(
          path: API.blogs,
          useMyPath: false,
          data: {'search': word ?? ''},
          showLoader: true,
        );
        switch (response.statusCode) {
          case 200:
            final errorResponseModel =
                ErrorResponseModel.fromJson(response.data);

            print(errorResponseModel.code);
            if (errorResponseModel.code == 200) {
              print(response.data);
              try {
                List<BlogModel> blogModel = [];

                for (var element in response.data['data']) {
                  blogModel.add(BlogModel.fromJson(element));
                }

                return Right(blogModel);
              } catch (e) {
                print(e);
                return Left(Failure(500, e.toString()));
              }
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
