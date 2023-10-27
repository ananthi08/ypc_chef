import 'package:chef_frontend/common_widget/videoplayer.dart';
import 'package:chef_frontend/service/get_api/GETproductcategory.dart';
import 'package:chef_frontend/service/imageupload/formfiled.dart';
import 'package:chef_frontend/service/imageupload/image_upload.dart';
import 'package:chef_frontend/service/provider/update_uploadvideo.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UploadVideo extends StatefulWidget {
  static String route = '/chef/upload';

  const UploadVideo({Key? key}) : super(key: key);

  @override
  _UploadVideoState createState() => _UploadVideoState();
}

class Ingredient {
  String name;
  String quantity;

  Ingredient(this.name, this.quantity);
}

class _UploadVideoState extends State<UploadVideo> {
  
  //for product serve category
  String selectedDropdownValue = 'Select';
  List<String> dropdownItems = [];

// for international category
  String selectedIValue = '';
  List<String> dropdownIItems = [];
  // for national category
  String selectedNValue = 'Select';
  List<String> dropdownNItems = ['Select'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

// final work
  final TextEditingController _dietTypeController = TextEditingController();
  final TextEditingController _productnameController = TextEditingController();
  final TextEditingController _mainCategoryController = TextEditingController();
  final TextEditingController _sideCategoryController = TextEditingController();
  final TextEditingController internationalController = TextEditingController();
  final TextEditingController nationalController = TextEditingController();
  final TextEditingController productserveController = TextEditingController();
  String? selectedCategory;
TextEditingController descriptionController = TextEditingController();
int maxWordLimit = 100;
  TextEditingController nameController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  FormfieldApi formdatas = FormfieldApi();
  final List<NewIngredient> ingredients = [];

  void addIngredientRow() {
    setState(() {
      TextEditingController nameController = TextEditingController();
      TextEditingController quantityController = TextEditingController();

      nameControllers.add(nameController);
      quantityControllers.add(quantityController);

      ingredients.add(NewIngredient('', ''));

      if (ingredients.isEmpty) {
        ingredients[0].name = nameController.text;
        ingredients[0].quantity = quantityController.text;
      }
    });
  }

  List<TextEditingController> nameControllers = [];
  List<TextEditingController> quantityControllers = [];

  void press() async {
    String category = selectedCategory ?? "";

    List<Map<String, dynamic>> ingredientsJson = [];

    if (ingredients.isEmpty) {
      ingredientsJson.add({
        'name': nameControllers[0].text,
        'quantity': quantityControllers[0].text,
      });
    } else {
      for (int i = 0; i < ingredients.length; i++) {
        ingredientsJson.add({
          'name': nameControllers[i].text,
          'quantity': quantityControllers[i].text,
        });
      }
    }

    if (_sideCategoryController.text.isNotEmpty) {
      category = _sideCategoryController.text;
    }

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

String videoUrl = prefs.getString('filePath') ?? '';

      // ignore: use_build_context_synchronously
      await formdatas.dataload(
        productname: _productnameController.text,
        diettype: _dietTypeController.text,
        category: category,
        international: internationalController.text,
        national: nationalController.text,
        productserve: productserveController.text,
        steps: descriptionController.text,
        videoUrl:videoUrl,
        ingredients: ingredientsJson,
        context: context,
      );

      print('Form data submitted successfully');
      print('Selected category: $category');
      print('Ingredients: $ingredientsJson');
    } catch (e) {
      print('Error submitting form data: $e');
    }
  }

  bool isText1Selected = true;

  String MainCategory = 'Main Dish';
  String SideCategory = 'Side Dish';
  // String selectedCategory = 'Veg';
  String selectedDietType = 'Veg';

  final ApiService _apiService = ApiService();

  // Future<void> _pickVideoFromGallery(BuildContext context) async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

  //   if (pickedFile != null) {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => VideoPlayerScreen(videoPath: pickedFile.path),
  //       ),
  //     );
  //   }
  // }


 final YourApiService _apiServicee = YourApiService();
  final picker = ImagePicker();
  XFile? pickedFile;

  Future<void> _pickVideoFromGallery() async {
    pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      String uploadResult = await _apiServicee.uploadVideo(pickedFile!.path);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(uploadResult),
        ),
      );
    }
  }

  
  @override
  void initState() {
    super.initState();
    fetchserveCategoryFromApi();
    fetchInternationaldata();
    nameControllers.add(TextEditingController());
    quantityControllers.add(TextEditingController());
  }

// fetchservecategory

  Future<void> fetchserveCategoryFromApi() async {
    try {
      final data = await _apiService.fetchservecategory();
      List<String> serveCategories = [];
      for (var item in data) {
        if (item.containsKey("serveCategory")) {
          serveCategories.add(item["serveCategory"]);
        }
      }

      setState(() {
        dropdownItems = serveCategories;
        selectedDropdownValue =
            serveCategories.isNotEmpty ? serveCategories[0] : 'Select';
      });
    } catch (e) {
      print('Error fetching : $e');
    }
  }

  // fetch international cuisine
  // for provider to store data

  List<Map<String, dynamic>> internationalList = [];

  Future<void> fetchInternationaldata() async {
    try {
      final data = await _apiService.fetchInternationalCuisine();
      List<Map<String, dynamic>> international = [];

      for (var item in data!) {
        if (item.containsKey("cuisine")) {
          international.add(item);
        }
      }

      setState(() {
        internationalList = international;
        dropdownIItems =
            international.map((item) => item["cuisine"] as String).toList();
        selectedIValue =
            dropdownIItems.isNotEmpty ? dropdownIItems[0] : 'Select';
      });
    } catch (e) {
      print('Error fetching : $e');
    }
  }

// end of international cuisine

// start of national cuisine

  List<int> _selectedCuisineIds = [];

  Future<void> fetchnationaldata() async {
    final selectedDataModel =
        Provider.of<SelectedDataModel>(context, listen: false);
    _selectedCuisineIds = selectedDataModel.selectedCuisineIds;

    try {
      final data = await _apiService.fetchnationalcuisine(_selectedCuisineIds);
      List<Map<String, dynamic>> international = [];
      for (var item in data!) {
        if (item.containsKey("cuisine")) {
          international.add(item);
        }
      }

      setState(() {
        internationalList = international;
        // print('interrrr $internationalList');

        dropdownNItems =
            international.map((item) => item["cuisine"] as String).toList();
        selectedNValue =
            dropdownNItems.isNotEmpty ? dropdownNItems[0] : 'Select';
      });
    } catch (e) {
      print('Error fetching : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('Upload Video'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDietType =
                                'Veg'; // Update the selected value
                            _dietTypeController.text =
                                selectedDietType; // Update the controller's value
                            print("Veg is selected");
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.4,
                          color: selectedDietType == 'Veg'
                              ? const Color.fromARGB(255, 35, 140, 1)
                              : Colors.transparent,
                          child: Center(
                            child: Text(
                              'Veg',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedDietType == 'Veg'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDietType =
                                'Non-Veg'; 
                            _dietTypeController.text =
                                selectedDietType;                          print("Non-Veg is selected");
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.4,
                          color: selectedDietType == 'Non-Veg'
                              ? const Color.fromARGB(255, 183, 0, 0)
                              : Colors.transparent,
                          child: Center(
                            child: Text(
                              'Non-Veg',
                              style: TextStyle(
                                fontSize: 18,
                                color: selectedDietType == 'Non-Veg'
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Product Name',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 5),
                TextFormField(
                  controller: _productnameController,
                  decoration: InputDecoration(
                    hintText: "Enter Product Name",
                    hintStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.grey.shade400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                  ),
                ),

                const SizedBox(height: 15),
                const Text(
                  'Product Category',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),

                Container(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                MainCategory,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Radio<String>(
                                value: 'Main',
                                groupValue: selectedCategory,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCategory = value;
                                    print(
                                        "Selected product category Value: $selectedCategory");
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                SideCategory,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                              ),
                              Radio<String>(
                                value: 'Side',
                                groupValue: selectedCategory,
                                onChanged: (value) {
                                  setState(() {
                                    selectedCategory = value;
                                    print(
                                        "Selected product category Value: $selectedCategory");
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),
                const Text(
                  'InterNational Cuisine',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 5),

// start of international category

                Container(
                  width: screenWidth * 0.7,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                      border: InputBorder.none,
                      suffixIcon: null,
                    ),
                    value: selectedIValue,
                    hint: const Text('Select international cuisine'),
                    onChanged: (String? newValue) async {
                      try {
                        await fetchInternationaldata();
                        final selectedData = internationalList.firstWhere(
                          (item) => item["cuisine"] == newValue,
                        );

                        if (selectedData.containsKey("id") &&
                            selectedData["id"] != null) {
                          print(
                              "Selected international cuisine: $newValue, id: ${selectedData["id"]}");
                          final selectedDataModel =
                              // ignore: use_build_context_synchronously
                              Provider.of<SelectedDataModel>(context,
                                  listen: false);
                          selectedDataModel
                              .updateSelectedData(selectedData["id"]);
                          fetchnationaldata();
                        } else {
                          print("Selected data is missing an ID.");
                        }
                      } catch (e) {
                        print("No matching data found for: $newValue");
                      }
                      // Update the controller with the selected value
                      internationalController.text = newValue ?? 'Select';
                    },
                    items: dropdownIItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

// end of international category
                const SizedBox(height: 5),
                // start of national category
                const Text(
                  'National Cuisine',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 5),

                Container(
                  width: screenWidth * 0.7,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                      border: InputBorder.none,
                      suffixIcon: null,
                    ),
                    value: selectedNValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedNValue = newValue!;

                        print("Selected  national cuisine: $selectedNValue");
                      });
                      nationalController.text = newValue ?? 'Select';
                    },
                    items: dropdownNItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // end of national category
                const SizedBox(height: 5),

                const Text(
                  'Product Serve Category',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  width: screenWidth * 0.7,
                  height: 55,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
                      border: InputBorder.none,
                      suffixIcon: null,
                    ),
                    value: selectedDropdownValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedDropdownValue = newValue!;
                        print(
                            "Selected  serve categoryValue: $selectedDropdownValue");
                      });

                      productserveController.text = newValue ?? 'Select';
                    },
                    items: dropdownItems
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                // product serve category end

                const SizedBox(height: 20),
                SizedBox(
                  width: screenWidth,
                  height: 80,
                  child: DottedBorder(
                    color: Colors.grey,
                    strokeWidth: 2,
                    dashPattern: const [8, 8],
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: Center(
                      child: GestureDetector(
                        onTap: () {
                          _pickVideoFromGallery();
                        },
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.cloud_upload),
                            SizedBox(height: 8),
                            Text('Upload Video'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 6),

                Column(
                  children: [
                    const SizedBox(height: 6),
                   Column(
  children: [
    Row(
      children: [
        const Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Ingredients',
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                addIngredientRow();
              },
              child: const Text(
                'Add +',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 157, 10, 0),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
    const SizedBox(height: 6),
    Column(
      children: [
        Container(
          height: 70,
          width: 500,
          color: Colors.grey.shade400,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: const Color.fromARGB(
                        255, 255, 255, 255),
                    child: Center(
                      child: TextField(
                        controller: nameControllers[0],
                        onChanged: (value) {
                          if (ingredients.isNotEmpty) {
                            ingredients[0].name = value;
                          }
                        },
                        decoration: const InputDecoration(
                          hintText: 'Enter Ingredient name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                      controller: quantityControllers[0],
                      onChanged: (value) {
                        if (ingredients.isNotEmpty) {
                          ingredients[0].quantity = value;
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: 'Qnty',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
    for (var i = 1; i < ingredients.length; i++)
      Dismissible(
        key: Key('ingredient_$i'),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          setState(() {
            ingredients.removeAt(i);
            nameControllers.removeAt(i);
            quantityControllers.removeAt(i);
          });
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 16),
          child: Icon(Icons.delete, color: Colors.white),
        ),
        child: Container(
          height: 70,
          width: 500,
          color: Colors.grey.shade400,
          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.white,
                    child: Center(
                      child: TextField(
                        controller: nameControllers[i],
                        decoration: const InputDecoration(
                          hintText: 'Enter Ingredient name',
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 7,
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.white,
                    child: TextField(
                      controller: quantityControllers[i],
                      decoration: const InputDecoration(
                        hintText: 'Qnty',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
  ],
),

                    const SizedBox(
                      height: 10,
                    ),



                    const Column(
                      children: [
                        Row(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Steps',
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                     SizedBox(
                      //  width: 340, 
                      width: MediaQuery.of(context).size.width, // <-- TextField width
                      height: 110, // <-- TextField height
                      child:
                       TextField(
                        controller: descriptionController,
                        maxLines: null,
                        expands: true,
                        keyboardType: TextInputType.multiline,
                        decoration:const InputDecoration(
                          filled: true,
                           hintText: 'Enter steps to be followed',
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        backgroundColor: const Color(0xFFA51C05),
                        minimumSize: const Size(175, 50),
                      ),
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {
                        press();
                        //     }
                      },
                      child: const Text(
                        'Upload',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewIngredient {
  String name;
  String quantity;

  NewIngredient(this.name, this.quantity);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'quantity': quantity,
    };
  }
}
