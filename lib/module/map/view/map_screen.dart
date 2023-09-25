import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get_storage/get_storage.dart';
import 'package:global_online/core/config/apis/config_api.dart';
import 'package:global_online/core/resources/resource.dart';
import 'package:global_online/core/utils/constant.dart';
import 'package:global_online/module/map/controller/map_controller.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.523856, 34.449014),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<MapController>(
        builder: (logic) {
          if(logic.isLoadingPostion= false ||  logic.myLocation == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Stack(

            children: [
             GoogleMap(

                mapType: MapType.normal,
                initialCameraPosition:  CameraPosition(
                    target: LatLng(
                        logic.myLocation?.latitude??0,
                        logic.myLocation?.longitude??0 ),
                  zoom: 20 ),
              zoomGesturesEnabled: true,

                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);

                },
               onTap: (postion){
                  print(postion);
               },
               // onCameraMove: (position) async {
               //   final GoogleMapController controller = await _controller.future;
               //   controller.moveCamera(CameraUpdate.newLatLng( LatLng(position.target.latitude, position.target.longitude),
               //
               //   ));
               //
               // },


                markers:{
                  Marker(markerId: MarkerId('marker'),position: LatLng(
                      logic.myLocation?.latitude??0,
                      logic.myLocation?.longitude??0 ),icon: logic.myIcon)
                },

              ),
              switch(logic.rxRequestStatus.value){


                RequestStatus.LOADING => PositionedDirectional(
                  bottom: 133,
                  start: 20.w,
                  end: 0,
                  child: Shimmer.fromColors(
                    baseColor: Colors.grey.withOpacity(0.2),
                    highlightColor: Colors.white.withOpacity(0.2),
                    child: SizedBox(
                      height: 100,

                      child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13.r)

                              ),
                              width: 268.w,
                              margin: EdgeInsetsDirectional.all(9),
                              padding: EdgeInsetsDirectional.symmetric(vertical: 11
                                  .h, horizontal: 14),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        'https://thumbs.dreamstime.com/b/hospital-building-modern-parking-lot-59693686.jpg',
                                        height: 64.h, width: 64,),
                                    ),
                                  ),
                                  SizedBox(width: 18,),
                                  Flexible(
                                      flex: 3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text('OXY GYM', style: getBoldStyle(
                                              color: Color(0xff333333),
                                              fontSize: 20.sp),),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on,
                                                color: Color(0xff44327C),),
                                              Text('1032 Mtr Left',
                                                style: getMediumStyle(
                                                    color: Color(0xffBDBDBD),
                                                    fontSize: 14.sp),)
                                            ],
                                          )

                                        ],))
                                ],
                              ),
                            );
                          }),
                    ),
                  ),
                ),

                RequestStatus.SUCESS => PositionedDirectional(
                  bottom: 133,
                  start: 20.w,
                  end: 0,
                  child:  SizedBox(
                      height: 100,

                      child: ListView.builder(
                          itemCount: logic.rxHealthyPlaceModel.value.data?.length??0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(13.r)

                              ),
                              width: 268.w,
                              margin: EdgeInsetsDirectional.all(9),
                              padding: EdgeInsetsDirectional.symmetric(vertical: 11
                                  .h, horizontal: 14),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Flexible(
                                    flex: 1,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: CachedNetworkImage(
                                        imageUrl:logic.rxHealthyPlaceModel.value.data?[index].image != null ? API.imageUrl(logic.rxHealthyPlaceModel.value.data?[index].image??''): 'https://thumbs.dreamstime.com/b/hospital-building-modern-parking-lot-59693686.jpg',
                                        height: 64.h, width: 64,),
                                    ),
                                  ),
                                  const SizedBox(width: 18,),
                                  Flexible(
                                      flex: 3,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        children: [
                                          Text(logic.rxHealthyPlaceModel.value.data?[index].name??'', style: getBoldStyle(
                                              color: Color(0xff333333),
                                              fontSize: 20.sp),
                                          maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Row(
                                            children: [
                                              const Icon(Icons.location_on,
                                                color: Color(0xff44327C),),
                                              Text('${(logic.rxHealthyPlaceModel.value.data![index].distance! /1000).toStringAsFixed(2)} KMtr',
                                                style: getMediumStyle(
                                                    color: Color(0xffBDBDBD),
                                                    fontSize: 14.sp),)
                                            ],
                                          )

                                        ],))
                                ],
                              ),
                            );
                          }),

                  ),
                ),

                RequestStatus.ERROR => SizedBox(),
              }

            ],
          );
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}