import 'package:flutter/material.dart';
import 'package:flexi_productimage_slider/flexi_productimage_slider.dart';
import 'package:gallery_zoom_slides/gallery_zoom_slides.dart';

class Imagesliderone extends StatefulWidget {
  const Imagesliderone({super.key, required this.title});

  final String title;

  @override
  State<Imagesliderone> createState() => _ImageslideroneState();
}

class _ImageslideroneState extends State<Imagesliderone> {
  List<String> arrayImages = const [
    "assets/img/01.jpg",
    "assets/img/02.jpg",
    "assets/img/03.jpg",
    "assets/img/04.jpg",
    "assets/img/05.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the Imagesliderone object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            flexiProductimageSlider(
              //required fields
              arrayImages: arrayImages,

              // optional fields

              //set where you want to set your thumbnail
              sliderStyle: SliderStyle.overSlider, //.nextToSlider

              // set you slider height like 1.0,1.5,2.0 etc...
              aspectRatio: 0.8,

              //set content mode of image
              boxFit: BoxFit.cover,

              //set this if you want to set any default image index when it loads
              selectedImagePosition: 0,

              //set your thumbnail alignment in slider
              thumbnailAlignment: ThumbnailAlignment.left, //.right , .bottom
              thumbnailBorderType: ThumbnailBorderType.all, //.bottom, .all
              thumbnailBorderWidth: 1.5, //double value

              //set corner radius of your thumbnail
              thumbnailBorderRadius: 2,

              //set your thumbnail height & width
              //NOTE : if you set ThumbnailShape.circle then set thumbnail width height same
              thumbnailWidth: 55,
              thumbnailHeight: 55,

              //set color of current image thumbnail border
              thumbnailBorderColor: Colors.blue,

              //make you action when user click on image
              onTap: (index) {
                print("selected index : $index");

                //for zooming effect on click
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => galleryZoomSlides(
                              //required fields
                              arrayImages: arrayImages,

                              //Optional fields
                              zoomTheme:
                                  ZoomTheme.theme3, //.theme1, .theme2, .theme3
                              selectedImagePosition: index,
                              selectedThumbnailColor: Colors.blue,
                            )));
              },
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
