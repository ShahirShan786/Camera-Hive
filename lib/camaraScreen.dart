import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

late List<CameraDescription> _cameras;

class Camarascreen extends StatefulWidget {
  const Camarascreen({super.key});

  @override
  State<Camarascreen> createState() => _CamarascreenState();
}

class _CamarascreenState extends State<Camarascreen> {
  late CameraController _controller;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializedCamara();
  }

  Future<void> initializedCamara() async {
    final _cameras = await availableCameras();

    _controller = CameraController(_cameras[0], ResolutionPreset.max);
    try {
      await _controller.initialize();
      if (!mounted) {
        return;
      }
      setState(() {
        _isCameraInitialized = true;
      });
    } catch (e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CamaraAccessDenied':
            print("CamaraAccess Denied");
            break;
          default:
            print(e.description);
            break;
        }
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: double.infinity,
              child: _isCameraInitialized
                  ? CameraPreview(
                      _controller,
                    )
                  : Center(child: CircularProgressIndicator()),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: IconButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(Colors.blue),
                        ),
                        onPressed: () async{
                          if(!_controller.value.isInitialized || _controller.value.isTakingPicture){
                            return null;
                          }
                          // try{
                          //    XFile picture = await _controller.takePicture();
                          // }on
                        },
                        icon: Icon(Icons.camera_alt_outlined)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
