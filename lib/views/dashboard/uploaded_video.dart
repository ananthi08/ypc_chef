import 'package:chef_frontend/common_widget/videoplayer.dart';
import 'package:chef_frontend/service/get_api/GETproductcategory.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  String selectedDropdownValue = 'Select';
  List<String> dropdownItems = ['Select'];

  final TextEditingController _textEditingController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _quantityEditingController =
      TextEditingController();

  final List<Ingredient> ingredients = [];

  void addIngredientRow() {
    setState(() {
      ingredients.add(Ingredient('', ''));
    });
  }

  bool isText1Selected = true;

  String MainCategory = 'Main Dish';
  String SideCategory = 'Side Dish';
  String selectedCategory = 'Veg';

  final ApiService _apiService = ApiService();

  Future<void> _pickVideoFromGallery(BuildContext context) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => VideoPlayerScreen(videoPath: pickedFile.path),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    try {
      final data = await _apiService.fetchData();
      List<String> items = [];
      for (var item in data) {
        items.add(item['name']);
      }
      setState(() {
        dropdownItems = items;
        selectedDropdownValue = items.isNotEmpty ? items[0] : 'Select';
      });
    } catch (e) {
      // Handle error
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
                          isText1Selected = true;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.4,
                        color: isText1Selected
                            ? const Color.fromARGB(255, 35, 140, 1)
                            : Colors.transparent,
                        child: Center(
                          child: Text(
                            'Veg',
                            style: TextStyle(
                              fontSize: 18,
                              color:
                                  isText1Selected ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isText1Selected = false;
                        });
                      },
                      child: Container(
                        width: screenWidth * 0.4,
                        color: !isText1Selected
                            ? const Color.fromARGB(255, 183, 0, 0)
                            : Colors.transparent,
                        child: Center(
                          child: Text(
                            'Non-Veg',
                            style: TextStyle(
                              fontSize: 18,
                              color: !isText1Selected
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
              TextField(
                controller: _textEditingController,
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
                height: 70, // Adjust the height as needed
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
                              value: MainCategory,
                              groupValue: selectedCategory,
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value!;
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
                              value: SideCategory,
                              groupValue: selectedCategory,
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value!;
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
                'Product Serve Category',
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: screenWidth * 0.7,
                height: 65,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Customize the border color
                    width: 1.0, // Customize the border width
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
                    });
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
                        _pickVideoFromGallery(context);
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
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: Align(
                  //         alignment: Alignment.centerLeft,
                  //         child: Text(
                  //           'Ingredients',
                  //           style: TextStyle(
                  //             fontSize: 15,
                  //             color: Color.fromARGB(255, 0, 0, 0),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //     Expanded(
                  //       child: Align(
                  //         alignment: Alignment.centerRight,
                  //         child: GestureDetector(
                  //           onTap: () {
                  //             addIngredientRow();
                  //           },
                  //           child: Text(
                  //             'Add +',
                  //             style: TextStyle(
                  //               fontSize: 15,
                  //               color: Color.fromARGB(255, 157, 10, 0),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
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
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Container(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      child: Center(
                                        child: TextField(
                                          onChanged: (value) {
                                            ingredients[0].name = value;
                                          },
                                          decoration: const InputDecoration(
                                            hintText: 'Enter Ingredient name',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.white,
                                      child: TextField(
                                        onChanged: (value) {
                                          ingredients[0].quantity = value;
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
                      // Additional rows for ingredients and quantities go here
                      ...ingredients
                          .skip(1)
                          .map(
                            (ingredient) => Container(
                              height: 70,
                              width: 500,
                              color: Colors.grey.shade400,
                              child: Container(
                                color: Colors.grey,
                                margin: EdgeInsets.fromLTRB(0, 10, 10, 0),
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
                                              onChanged: (value) {
                                                ingredient.name = value;
                                              },
                                              decoration: const InputDecoration(
                                                hintText:
                                                    'Enter Ingredient name',
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
                                            onChanged: (value) {
                                              ingredient.quantity = value;
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
                            ),
                          )
                          .toList(),
                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),
                  Column(
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
                  SizedBox(
                    height: 10,
                  ),
                  // Column(
                  //   children: [
                  //     Container(
                  //       height: 100,
                  //       width: 340,
                  //       color: Colors.grey,
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //               borderRadius: BorderRadius.circular(5)),
                  //         ),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  SizedBox(
                    width: 340, // <-- TextField width
                    height: 110, // <-- TextField height
                    child: TextField(
                      maxLines: null,
                      expands: true,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                        filled: true,
                      ),
                    ),
                  ),

                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: <Widget>[
                  //     const Padding(
                  //       padding:
                  //           EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  //       child: TextField(
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(),
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // )
                  const SizedBox(
                    height: 10,
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      primary: const Color(0xFFA51C05),
                      minimumSize: const Size(175, 50),
                    ),
                    onPressed: () {
                      // if (_formKey.currentState!.validate()) {
                      //       verifyEmail();
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
    );
  }
}
