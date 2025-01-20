import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GooglemapAplication extends StatefulWidget {
  const GooglemapAplication({super.key});

  @override
  State<GooglemapAplication> createState() => _GooglemapAplicationState();
}

class _GooglemapAplicationState extends State<GooglemapAplication> {
  TextEditingController mapcontroller=TextEditingController();
  late GoogleMapController gmapcontroller;
  String address="";
  List<Marker> Markerlist=[];
  //LatLng
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
            Text("Location",style:TextStyle(fontSize: 25,fontWeight:FontWeight.bold),),
            TextField(
              controller: mapcontroller,
              decoration: InputDecoration(
                prefixIcon: IconButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return GoogleMap(
                          onMapCreated: (controller) {
                            gmapcontroller=controller;
                          },
                          markers: Markerlist.toSet(),
                          initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  24.344115155756928, 54.53055388587851),
                              zoom: 14),
                          onTap: (argument) {
                            setState(() {
                              Markerlist.add(Marker(markerId: MarkerId("Current location"),position: argument));
                            });
                            location_address(argument.latitude, argument.longitude);
                          },
                        );
                      },
                    );
                  },
                  icon: Icon(Icons.location_pin),
                ),
              ),
            ),
      ]
      )
    );
  }
  Future<void> location_address(double latitude,double longitude) //add geocoding in terminal
  async {
   //placemark is in the geocoding package for getting address of location from latitude and longitude
    List<Placemark> locationaddr=await placemarkFromCoordinates(latitude, longitude);

    address=locationaddr[0].street!+locationaddr[0].country.toString();
    //locationaddr[0] gives the address of that point you selected
    setState(() {
      mapcontroller.text=address;
    });

  }
}