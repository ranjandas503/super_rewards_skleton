import 'dart:io';
import 'package:image_picker/image_picker.dart';
import '../utils/exporter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  XFile? _image;
  String? _errorEmail;
  String? _errorPassword;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(strLoginTitle, true, onBackPress: context.onBackPress),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(padding_32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _getUserImage(),
            const SizedBox(height: padding_32),
            _createTextField(strEmail, _emailController, EMAIL_REGEX, strEnterProperEmail, _errorEmail),
            const SizedBox(height: padding_32),
            _createTextField(strPassword, _passwordController, PASSWORD_REGEX, strEnterProperPassword, _errorPassword),
            const SizedBox(height: padding_32),
            createDefaultElevatedButton(context, strLoginTitle, () {_performLoginAction(context);
            }),
          ],
        ),
      ),
    );
  }

  Widget _getUserImage() {
    return InkWell(
      onTap: () {
        _pickImage(ImageSource.gallery);
      },
      child: Container(
        width: imageWidthHeight,
        height: imageWidthHeight,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: colorPrimary,
        ),
        child: ClipOval(
          child: Center(
            child: (_image == null)
                ? const Icon(Icons.account_circle)
                : Image.file(
                    File(_image!.path),
                    width: imageWidthHeight,
                    height: imageWidthHeight,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }

  Widget _createTextField(String hint, TextEditingController textController,
      String regexString, String regexError, String? errorStr) {
    return TextFormField(
      controller: textController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (input) => isValidData(regexString, input) ? null : regexError,
      decoration: InputDecoration(
        hintText: hint,
        focusedBorder: outlineInputBorder(colorPrimary),
        enabledBorder: outlineInputBorder(colorPrimary),
        errorBorder: outlineInputBorder(colorError),
        focusedErrorBorder: outlineInputBorder(colorError),
        errorText: errorStr,
      ),
    );
  }

  // pick actual image from library
  Future _pickImage(ImageSource source) async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(source: source);
    setState(() {
      _image = pickedImage;
    });
  }

  void _performLoginAction(BuildContext context) {
    setState(() {
      // if fields are empty
      _errorEmail = (_emailController.text.isEmpty) ? strEnterEmail : null;
      _errorPassword =
          (_passwordController.text.isEmpty) ? strEnterPassword : null;

      // if user hasn't selected the image
      if (_image == null) {
        context.showSnackbar(strEnterImage, isError: true);
      }

      // if everything is proper we can proceed to next screen by omitting this screen
      if (_errorEmail == null && _errorPassword == null && _image != null) {
        popAndPushNamed(context, homeScreen);
      }
    });
  }
}
