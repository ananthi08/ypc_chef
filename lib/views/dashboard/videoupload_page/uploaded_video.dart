import 'package:chef_frontend/common_widget/custom_GREEN/customgreen.dart';
import 'package:chef_frontend/common_widget/videoplayer.dart';
import 'package:chef_frontend/service/get_api/GETproductcategory.dart';
import 'package:chef_frontend/service/imageupload/formfiled.dart';
import 'package:chef_frontend/service/imageupload/image_upload.dart';
import 'package:chef_frontend/service/provider/update_uploadvideo.dart';
import 'package:chef_frontend/views/dashboard/dashboard_view.dart';
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

class Steps {
  String steps;
  String stepsdescription;

  Steps(this.steps, this.stepsdescription);
}

class _UploadVideoState extends State<UploadVideo> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool isButtonEnabled = false;
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
  final List<NewSteps> steps = [];

  // get stepdesControllers => null;

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

  void stepsRow() {
    setState(() {
      TextEditingController stepController = TextEditingController();
      TextEditingController stepdesController = TextEditingController();

      stepControllers.add(stepController);
      stepdesControllers.add(stepdesController);
      _incrementCounter();

      steps.add(NewSteps('', ''));

      if (steps.isEmpty) {
        steps[0].steps = stepController.text;
        steps[0].stepsdescription = stepdesController.text;
      }
    });
  }

  List<TextEditingController> nameControllers = [];
  List<TextEditingController> quantityControllers = [];
  List<TextEditingController> stepControllers = [];
  List<TextEditingController> stepdesControllers = [];
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
    List<Map<String, dynamic>> stepsJson = [];
    if (steps.isEmpty) {
      stepsJson.add({
        'steps': stepControllers[0].text,
        'stepsdescription': stepdesControllers[0].text,
      });
    } else {
      for (int i = 0; i < steps.length; i++) {
        stepsJson.add({
          'steps': "${i + 1}",
          'stepsdescription': stepdesControllers[i].text,
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
        // steps: descriptionController.text,
        steps: stepsJson,
        videoUrl: videoUrl,
        ingredients: ingredientsJson,
        context: context,
      );
    } catch (e) {
      print('Error submitting form data: $e');
    }
  }

  bool videoUploaded = false;
  bool isText1Selected = true;

  String MainCategory = 'Main Dish';
  String SideCategory = 'Side Dish';

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
      String uploadResult = await _apiServicee.uploadVideo(pickedFile!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(uploadResult),
        ),
      );
      print("dsdsdsadasdasdas");
      if (uploadResult == 'Video uploaded successfully') {
        setState(() {
          videoUploaded = true;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    fetchserveCategoryFromApi();
    fetchInternationaldata();
    nameControllers.add(TextEditingController());
    quantityControllers.add(TextEditingController());
    stepControllers.add(TextEditingController());
    stepdesControllers.add(TextEditingController());
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
                              ? CustomColor.myRedColor
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
                            selectedDietType = 'Non-Veg';
                            _dietTypeController.text = selectedDietType;
                            print("Non-Veg is selected");
                          });
                        },
                        child: Container(
                          width: screenWidth * 0.4,
                          color: selectedDietType == 'Non-Veg'
                              ? const Color.fromARGB(255, 157, 10, 0)
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
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                          if (videoUploaded) {
                          } else {
                            _pickVideoFromGallery();
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (videoUploaded)
                              const Text('Video Uploaded successfully!')
                            else
                              const Icon(
                                Icons.cloud_upload,
                              ),
                            const SizedBox(height: 8),
                            if (!videoUploaded) const Text('Upload Video')
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
                                      color: CustomColor.myRedColor,
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
                              color: CustomColor.myRedColor,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
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
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            const Expanded(
                              flex: 9,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Click the add button to Enter the Steps',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: GestureDetector(
                                  onTap: () {
                                    stepsRow();
                                  },
                                  child: const Text(
                                    'Add +',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: CustomColor.myRedColor,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 6),
                        for (var i = 0; i < steps.length; i++)
                          Dismissible(
                            key: Key('steps_$i'),
                            direction: DismissDirection.endToStart,
                            onDismissed: (direction) {
                              setState(() {
                                steps.removeAt(i);
                                stepControllers.removeAt(i);
                                stepdesControllers.removeAt(i);
                              });
                            },
                            background: Container(
                              color: CustomColor.myRedColor,
                              alignment: Alignment.centerRight,
                              padding: const EdgeInsets.only(right: 16),
                              child:
                                  const Icon(Icons.delete, color: Colors.white),
                            ),
                            child: Container(
                              height: 70,
                              width: 500,
                              color: Colors.grey.shade400,
                              margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.all(14.0),
                                          child: Opacity(
                                              opacity: 0.6,
                                              child: Text('Steps ${i + 1}')),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        color: Colors.white,
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10),
                                          child: TextField(
                                            controller: stepdesControllers[i],
                                            decoration: const InputDecoration(
                                              hintText: 'Steps Description',
                                            ),
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
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: isButtonEnabled
                            ? CustomColor.myRedColor
                            : Colors.grey,
                        minimumSize: const Size(175, 50),
                      ),
                      onPressed: isButtonEnabled
                          ? () {
                              if (_formKey.currentState!.validate()) {
                                press();
                              }
                            }
                          : null,
                      child: const Text(
                        'Upload',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      


// floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: Container(
//         margin: const EdgeInsets.only(top: 3),
//         height: 50,
//         width: 50,
//         child: FloatingActionButton(
//           backgroundColor: Colors.white,
//           elevation: 0,
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => const UploadVideo(),
//               ),
//             );
//           },
//           shape: RoundedRectangleBorder(
//             side: const BorderSide(
//               width: 3,
//               color: Color.fromARGB(255, 169, 169, 169),
//             ),
//             borderRadius: BorderRadius.circular(100),
//           ),
//           child: const Icon(
//             Icons.add,
//             color: Color.fromARGB(255, 173, 20, 0),
//           ),
//         ),
//       ),
      bottomNavigationBar: BottomAppBar(
        // shape: CircularNotchedRectangle(),
        color:const Color.fromARGB(255, 240, 240, 240),
      


      child: Container(

        height: 50,

        child: Row(
          
          mainAxisAlignment:MainAxisAlignment.spaceAround,
          children: 
        [
// for home
          IconButton(onPressed: (){
            Navigator.pushNamed(context, Dashboardview.route);
          },
          icon: Icon(Icons.home_filled,color: Color.fromARGB(255, 173, 20, 0),)
          ),

// for cart
            IconButton(onPressed: (){
            
          }, 
          
          icon: Icon(Icons.shopping_cart_checkout,color: Color.fromARGB(255, 173, 20, 0),)
          ),
// fornotification
          IconButton(onPressed: (){
            
          }, 
          
          icon: Icon(Icons.notifications_active,color:Color.fromARGB(255, 173, 20, 0),)
          ),

        


        ],
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

class NewSteps {
  String steps;
  String stepsdescription;

  NewSteps(this.steps, this.stepsdescription);

  Map<String, dynamic> toJson() {
    return {
      'steps': steps,
      'stepsdescription': stepsdescription,
    };
  }
}
