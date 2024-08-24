import 'dart:io';
import 'package:appstore1/service/data_base.dart';
import 'package:appstore1/widget/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddFood extends StatefulWidget {
  const AddFood({super.key});

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {
   final ImagePicker _picker = ImagePicker();
  File? selectedImage;

  Future getImage() async {
    var image = await _picker.pickImage(source: ImageSource.gallery);
if(image!=null){
setState(() {
    selectedImage = File(image!.path);
  
});
}

  }

  uploadItem() async {
    if (selectedImage != null &&
        name.text != "" &&
        price.text != "" &&
        details.text != "") {
     

      Reference firebaseStorageRef =
          FirebaseStorage.instanceFor(bucket: 'gs://appfood1-3039f.appspot.com').ref().child("blogImages");
      final UploadTask task = firebaseStorageRef.putFile(selectedImage!);

      var downloadUrl = await (await task).ref.getDownloadURL();

      Map<String, dynamic> addItem = {
        "Image": downloadUrl,
        "Name": name.text,
        "Price": price.text,
        "Detail": details.text
      };
      await DatabaseMethods().addFoodItme(addItem, value!).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orangeAccent,
            content: Text(
              "Food Item has been added Successfully",
              style: TextStyle(fontSize: 18.0),
            )));
            Navigator.of(context).pushReplacementNamed('addfood');
      });
    }
  }
  // File? selectimage;
  // final ImagePicker picker = ImagePicker();
  // String? imageUrl;

  // // Get image from gallery
  // Future<void> getimage() async {
  //   final XFile? image = await picker.pickImage(source: ImageSource.camera);
  //   if (image != null) {
  //     setState(() {
  //       selectimage = File(image.path);
  //     });
  //   }
  // }

  // // Upload image to Firebase Storage
  // Future<void> uploadImage() async {
  //   if (selectimage != null) {
  //     try {
  //       final Reference storageReference = FirebaseStorage.instance
  //           .ref()
  //           .child('food_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
  //       final UploadTask uploadTask = storageReference.putFile(selectimage!);
  //       final TaskSnapshot downloadUrl = await uploadTask;
  //       imageUrl = await downloadUrl.ref.getDownloadURL();
  //     } catch (e) {
  //       print('Failed to upload image: $e');
  //     }
  //   }
  // }

  // // Add food item to Firestore
  // Future<void> addFoodItem() async {
  //   if (value == null) {
  //     print("Please select a category.");
  //     return;
  //   }

  //   await uploadImage(); // Upload image first
  //   if (imageUrl != null) {
  //     CollectionReference collection =
  //         FirebaseFirestore.instance.collection(value!);

  //     return collection
  //         .add({
  //           'name': name.text,
  //           'price': price.text,
  //           'details': details.text,
  //           'image_url': imageUrl, // Add image URL to Firestore
  //         })
  //         .then((value) {
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             backgroundColor: Colors.orange,
  //             content: Text("Food Items Is Add Successfuly",style: TextStyle(fontSize: 18.0),)));
  //         })
  //         .catchError((error){
  //           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //             backgroundColor: Colors.red[500],
  //             content: Text("Failed to add food item: $error",style: TextStyle(fontSize: 18.0),)));
  //         });
  //   }
  // }

  final List<String> itmes = ['ice-creame', 'pizza', 'burger', 'salad'];
  String? value;
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_outlined, color: Color(0xFF373866)),
        centerTitle: true,
        title: Text("Add Items", style: WidgetApp.headlinefiledtextstyle()),
      ),
      body: ListView(
        children: [
        Container(
          margin: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Upload The Items Picture", style: WidgetApp.saladfiledtextstyle()),
              SizedBox(height: 20),
              selectedImage == null
                  ? GestureDetector(
                      onTap: getImage,
                      child: Center(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Icon(Icons.camera_alt_outlined, color: Colors.black),
                          ),
                        ),
                      ),
                    )
                  : GestureDetector(
                      child: Center(
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1.5),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
              SizedBox(height: 30.0),
              Text("Item Name", style: WidgetApp.saladfiledtextstyle()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: name,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Item Name',
                      hintStyle: WidgetApp.Lightheadfiledtextstyle()),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Item Price", style: WidgetApp.saladfiledtextstyle()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: price,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Item Price',
                      hintStyle: WidgetApp.Lightheadfiledtextstyle()),
                ),
              ),
              SizedBox(height: 30.0),
              Text("Item Details", style: WidgetApp.saladfiledtextstyle()),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color(0xFFececf8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  maxLines: 6,
                  controller: details,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Item Details',
                      hintStyle: WidgetApp.Lightheadfiledtextstyle()),
                ),
              ),
              SizedBox(height: 20.0),
              Text("Select Category", style: WidgetApp.saladfiledtextstyle()),
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color(0xFFececf8), borderRadius: BorderRadius.circular(10)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    items: itmes
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(fontSize: 18.0, color: Colors.black),
                              ),
                            ))
                        .toList(),
                    onChanged: (value) => setState(() {
                      this.value = value;
                    }),
                    dropdownColor: Colors.white,
                    hint: Text("Select Category"),
                    iconSize: 36,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                    value: value,
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: (){
                  uploadItem();
                },
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Add",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
]),
    );
  }
}
