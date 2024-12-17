import 'dart:io';
// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:image_picker/image_picker.dart';
import '../customizations/app_style.dart';
import '../customizations/size_config.dart';
import '../widget/fab.dart';
import 'package:transparent_image/transparent_image.dart'
    show kTransparentImage;

class ScanToLoad extends StatefulWidget {
  const ScanToLoad({
    super.key,
  });

  @override
  State<ScanToLoad> createState() => _ScanToLoadState();
}

class _ScanToLoadState extends State<ScanToLoad> {
  File? _imageFile;
  String _mlResult = 'No Result';
  final _picker = ImagePicker();

  Future<bool> _pickImage() async {
    setState(() {
      this._imageFile = null;
    });
    final File? imageFile = await showDialog<File>(
        context: context,
        builder: ((context) => SimpleDialog(
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text('Take picture'),
                  onTap: () async {
                    final XFile? pickedFile =
                        await _picker.pickImage(source: ImageSource.camera);
                    if (mounted && pickedFile != null) {
                      Navigator.pop(context, File(pickedFile.path));
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.image),
                  title: const Text('pick from gallery'),
                  onTap: () async {
                    try {
                      final XFile? pickedFile =
                          await _picker.pickImage(source: ImageSource.gallery);
                      if (mounted && pickedFile != null) {
                        Navigator.pop(context, File(pickedFile.path));
                      }
                    } catch (e) {
                      print(e);
                      Navigator.pop(context, null);
                    }
                  },
                ),
              ],
            )));
    if (mounted && imageFile == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('please pick one image first.')),
      );
      return false;
    }
    setState(() {
      this._imageFile = imageFile;
    });
    debugPrint('picked image: $_imageFile');
    return true;
  }

  Future<void> _textOcr() async {
    setState(() {
      _mlResult = 'no result';
    });
    if (await _pickImage() == false) {
      return;
    }
    String result = '';
    // final InputImage inputImage = InputImage.fromFile(_imageFile!);
    // final TextRecognizer textDetector = GoogleMlKit.vision.textRecognizer();
    // final RecognizedText recognizerText =
    //     await textDetector.processImage(inputImage);
    // final String text = recognizerText.text;
    // debugPrint('Recognized text: $text');
    // result += 'Detected ${recognizerText.blocks.length} text blocks. \n';
    // for (final TextBlock block in recognizerText.blocks) {
    //   final Rect boundingBox = block.boundingBox;
    //   final List<Point<int>> cornerPoints = block.cornerPoints;
    //   final String text = block.text;
    //   final List<String> languages = block.recognizedLanguages;
    //   result += '\n# Text block: \n '
    //       'bbox=$boundingBox\n '
    //       'cornerPoints=$cornerPoints\n '
    //       'text=$text\n languages=$languages';
    // }
    if (result.isNotEmpty) {
      setState(() {
        this._mlResult = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      floatingActionButton: fab(),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 24),
          child: Container(
            width: SizeConfig.blockSizeHorizontal! * 6,
            height: SizeConfig.blockSizeVertical! * 6,
            //    margin: EdgeInsets.all(1),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhite,
                boxShadow: [
                  BoxShadow(
                    color: kBrown.withOpacity(0.10),
                    spreadRadius: -1.0,
                    blurRadius: 9.0,
                    offset: const Offset(0, 5),
                  ),
                ]),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
                 
              icon: const Icon(Icons.chevron_left),
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: kWhite,
            ),
          ),
          const CircleAvatar(
            radius: 20,
            backgroundColor: kGrey,
            backgroundImage: AssetImage('assets/images/pic-2.png'),
          ),
          const SizedBox(
            width: 24,
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
            Color(0xff6A6A6A),
            Color.fromARGB(255, 63, 62, 62),
          ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
            // statusBarColor: Color.fromARGB(255, 30, 29, 31)
            statusBarIconBrightness: Brightness.light),
      ),
      body: ListView(
        //  padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          // ignore: unnecessary_null_comparison
          if (_mlResult == null)
            const Placeholder(
              fallbackHeight: 200.0,
            )
          else
          if(_imageFile != null)
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: FileImage(this._imageFile!),
            ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Scrollbar(
                child: OverflowBar(
              children: [
                ElevatedButton(
                    onPressed: () => _textOcr(),
                    child: const Text('Scan Card To Load')),
                ElevatedButton(
                    onPressed: () => _textOcr(),
                    child: const Text('Scan Card To Load'))
              ],
            )),
          ),
          const Divider(),
          Text(
            'Result: ',
            style: kEncodeSansRegular.copyWith(
                color: kBlack, fontSize: SizeConfig.blockSizeHorizontal! * 1.3),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Text(_mlResult),
          )
        ],
      ),
    );
  }
}



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:url_launcher/url_launcher.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ScanToLoad(),
//     );
//   }
// }

// class ScanToLoad extends StatefulWidget {
//   @override
//   _ScanToLoadState createState() => _ScanToLoadState();
// }

// class _ScanToLoadState extends State<ScanToLoad> {
//   File? _imageFile;
//   String _extractedText = '';

//   final ImagePicker _picker = ImagePicker();

//   Future<void> _pickImage() async {
//     final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

//     if (pickedFile == null) {
//       return;
//     }

//     setState(() {
//       _imageFile = File(pickedFile.path);
//       _extractedText = '';
//     });
//   }

//   Future<void> _processImage() async {
//     if (_imageFile == null) {
//       return;
//     }

//     final inputImage = InputImage.fromFile(_imageFile!);
//     final textRecognizer = GoogleMlKit.vision.textRecognizer();
//     final RecognizedText recognizedText = await textRecognizer.processImage(inputImage);

//     String extractedText = recognizedText.text;

//     // Extract digits from the recognized text
//     RegExp digitPattern = RegExp(r'\d+');
//     Match match = digitPattern.firstMatch(extractedText);
//     if (match != null) {
//       extractedText = match.group(0)!;
//     } else {
//       extractedText = 'No digits found';
//     }

//     setState(() {
//       _extractedText = extractedText;
//     });

//     // Launch phone caller app
//     final phoneNumber = _extractedText;
//     final url = 'tel:$phoneNumber';

//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Could not launch the phone caller app')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Scan to Load Airtime'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             if (_imageFile != null) ...[
//               Image.file(_imageFile!),
//               SizedBox(height: 20),
//               Text(_extractedText),
//             ] else ...[
//               Text('No image selected'),
//             ],
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _pickImage,
//               child: Text('Pick Image'),
//             ),
//             ElevatedButton(
//               onPressed: _processImage,
//               child: Text('Process and Call'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// void main() {
//   final text = "Hello, my phone number is 123-456-7890 and my age is 25.";

//   // Define the digitPattern RegExp
//   RegExp digitPattern = RegExp(r'\d+');

//   // Use RegExp.allMatches to find all digit sequences in the text
//   final matches = digitPattern.allMatches(text);

//   // Extract and print the matched digit sequences
//   for (Match match in matches) {
//     final matchedDigits = match.group(0); // Extract the matched digits
//     print(matchedDigits);
//   }
// }



// void main() {
//   final text = "Hello, my phone number is 123-456-7890 and my age is 25.";

//   // Define the digitPattern RegExp
//   RegExp digitPattern = RegExp(r'\d+');

//   // Use RegExp.allMatches to find all digit sequences in the text
//   final matches = digitPattern.allMatches(text);

//   // Extract and print the matched digit sequences in one line without commas
//   final matchedDigitsList = matches.map((match) => match.group(0)).toList();
//   final matchedDigitsString = matchedDigitsList.join("");
//   print(matchedDigitsString);
// }


// void main() {
//   final multilineText = '''
//     Line 1: This is the first line.
//     Line 2: Here's the second line.
//     Line 3: We want to extract text from this line.
//     Line 4: Another line of text.
//     Line 5: And one more line.
//   ''';

//   // Split the multiline text into lines
//   final lines = multilineText.split('\n');

//   // Extract text from the 3rd line (index 2, since the list is 0-based)
//   if (lines.length > 2) {
//     final thirdLine = lines[2];
//     print(thirdLine);
//   } else {
//     print("The text doesn't have a 3rd line.");
//   }
// }


// here it is


// // Assuming you have already extracted the text and have it in the `recognizedText` variable

// // Find the third block (assuming 0-based index)
// int targetBlockIndex = 2; // 2 represents the third block, adjust as needed

// if (recognizedText.blocks.length > targetBlockIndex) {
//   final TextBlock targetBlock = recognizedText.blocks[targetBlockIndex];
  
//   // Now you can work with the content of the third block
//   final String textInThirdBlock = targetBlock.text;
//   print("Text in the third block: $textInThirdBlock");
// } else {
//   print("There are not enough blocks to target the third block.");
// }
