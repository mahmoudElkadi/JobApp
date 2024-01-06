import 'dart:io';
import 'dart:ui';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jobchat/core/utils/constants.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:jobchat/features/personal%20details/presentation/manger/image%20cubit/personal_details_state.dart';

class ImagePickerCubit extends Cubit<ImagePickerState>{
  ImagePickerCubit():super(ImagePickerInitial());
  static ImagePickerCubit get(context) => BlocProvider.of(context);

final ImagePicker _picker=ImagePicker();

String? imageUrl;
String? imagePath;

List<String> imageFile=[];

void pickImage ()async{
  XFile? _imageFile =await _picker.pickImage(source:ImageSource.gallery);
  _imageFile=await cropImage(_imageFile!);
  if(_imageFile != null){
    imageFile.add(_imageFile.path);
    uploadImage(_imageFile);
    imagePath =_imageFile.path;

  }else{
    return;
  }
}

Future <XFile?> cropImage(XFile imageFile)async{
  CroppedFile? croppedFile=await ImageCropper.platform.cropImage(
      sourcePath:imageFile.path,
    maxHeight: 800,
    maxWidth: 600,
    compressQuality: 70,
    cropStyle: CropStyle.rectangle,
    aspectRatioPresets: [CropAspectRatioPreset.ratio5x4],
    uiSettings: [
      AndroidUiSettings(
        toolbarColor: Color(kLightBlue.value),
        toolbarTitle: "JobHub Cropper",
        toolbarWidgetColor: Color(kLight.value),
        initAspectRatio: CropAspectRatioPreset.ratio5x4,
        lockAspectRatio: true,
      ),
      IOSUiSettings(
        title: "jobHub",
      )
    ]
  );
  if(croppedFile !=null){
    emit(CroppedSuccess());
    return XFile(croppedFile.path);
  }else{
    return null;
  }


}

  void uploadImage(XFile image)async{
    var cloudinary = CloudinaryPublic('dxsrhu3ku', 'eaqntkio');
    String? imageUrl;
    CloudinaryResponse res = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(image.path, folder: "userImage"));
    imageUrl=res.secureUrl;
    emit(ImagePickerSuccess());
  }





}