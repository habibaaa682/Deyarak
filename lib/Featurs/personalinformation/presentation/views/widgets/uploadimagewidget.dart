import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../controllers/sharedPrefrenceController.dart';
import '../../../../../core/utils/api_service.dart';
import 'package:http_parser/http_parser.dart';

class UploadImageWidget extends StatefulWidget {
  UploadImageWidget();

  @override
  State<UploadImageWidget> createState() => _UploadImageWidgetState();
}

class _UploadImageWidgetState extends State<UploadImageWidget> {
  File? _selectedImage;

  _UploadImageWidgetState();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _selectedImage != null
            ? Center(
                child: Stack(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(_selectedImage!),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: _getImage,
                      ),
                      bottom: -10,
                      left: 65,
                    ),
                  ],
                ),
              )
            : Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/User-avatar.svg.png',
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      child: IconButton(
                        icon: Icon(Icons.add_a_photo),
                        onPressed: _getImage,
                      ),
                      bottom: -10,
                      left: 65,
                    ),
                  ],
                ),
              ),
        ElevatedButton(

          onPressed: () async {
            if (_selectedImage != null) {
              final imageUrl =
                  await _uploadImage(_selectedImage!, ApiService(Dio()));

            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Please select an image first'),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Text('Upload Image'),
          style: ElevatedButton.styleFrom(
            primary: Color(0xffFF725E), // Set the button color
          ),
        ),
      ],
    );
  }
   XFile? image;
  Future<void> _getImage() async {
    final ImagePicker pickedFile = ImagePicker();
     image =
        await pickedFile.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _selectedImage = File(image!.path);
      });
    }
  }

  Future<String?> _uploadImage(File image, ApiService apiService) async {
    try {
      // Create FormData object and populate it with the image file
      FormData formData = FormData.fromMap({
        'photo': await MultipartFile.fromFile(image.path,
            filename: image.path.split('/').last,
          contentType: MediaType('image','jpg'),

        ),
      });

      // Get the token
      String token = GlobalSharedPreferences.getString('token') ?? '';

      // Debugging: Print image path and form data
      print('Uploading image: ${image.path}');
      print('Form Data fields: ${formData.fields}');
      print('Form Data files: ${formData.files}');

      // Perform API request to upload image
      final response = await apiService.patchFormData(
        endPointPath: 'users/updateMe',
        token: token,
        data: formData,
        validateStatus: (status)=>true,


      );
      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image uploaded successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        return response.data['data']['photo']['url'];
        // Adjust based on your API response
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to upload image: ${response.statusCode} ${response.statusMessage}'),
            backgroundColor: Colors.red,
          ),
        );
        return null;
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during image upload: ${e.message}'),
          backgroundColor: Colors.red,
        ),
      );
      print('DioError: $e');
      return null;
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error during image upload: $e'),
          backgroundColor: Colors.red,
        ),
      );
      print('Error: $e');
      return null;
    }
  }


}
