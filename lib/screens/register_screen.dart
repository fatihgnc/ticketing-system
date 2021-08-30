import 'package:flutter/material.dart';
import 'package:ticketing_system/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const routeName = '/register';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  final _passConfirmController = TextEditingController();

  void _saveUser() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    _formKey.currentState!.save();
    FocusManager.instance.primaryFocus!.unfocus();
  }

  TextFormField _buildTextField({
    required String keyName,
    required IconData fieldIcon,
    required String labelText,
    required String? Function(String? inputVal) validator,
    TextInputType? keyboardType,
    TextEditingController? controller,
    bool? obscureText,
  }) {
    return TextFormField(
      key: ValueKey(keyName),
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        labelText: labelText,
        icon: Icon(fieldIcon),
      ),
      validator: validator,
    );
  }

  String? _validateInput({
    required String inputVal,
    required bool shouldCheckContains,
    required int lowLimit,
    String? stringToCheckContains,
    int? highLimit,
    bool? shouldContain,
    bool? willConfirmPassword,
    String? passTxt,
    String? confirmPassTxt,
  }) {
    if (inputVal.trim().isEmpty) {
      return 'This field is required!';
    }

    if (highLimit != null) {
      if (inputVal.length < lowLimit || inputVal.length > highLimit) {
        return 'Short or long input!';
      }
    } else {
      if (inputVal.length < lowLimit) {
        return 'Short input!';
      }
    }

    if (stringToCheckContains != null) {
      if (shouldContain != null) {
        if (shouldContain
            ? inputVal.contains(stringToCheckContains)
            : !inputVal.contains(stringToCheckContains)) {
          return null;
        }
        return shouldContain
            ? 'Input should contain $stringToCheckContains!'
            : 'Input should not contain $stringToCheckContains';
      }
    }

    if (willConfirmPassword != null) {
      if (passTxt != null && confirmPassTxt != null) {
        return passTxt == confirmPassTxt ? null : 'Passwords do not match!';
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 20,
            ),
          ],
        ),
        margin: const EdgeInsets.only(
          top: 30,
          left: 20,
          right: 20,
        ),
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        height: deviceHeight * 0.80,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'REGISTER',
                style: Theme.of(context).textTheme.headline4,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // FULL NAME
                    _buildTextField(
                      keyName: 'name',
                      fieldIcon: Icons.text_format,
                      labelText: 'Full Name',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 6,
                      ),
                    ),
                    // COMPANY NAME
                    _buildTextField(
                      keyName: 'company',
                      fieldIcon: Icons.business,
                      labelText: 'Company Name',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 4,
                        highLimit: 40,
                      ),
                    ),
                    // BRANCH NAME
                    _buildTextField(
                      keyName: 'branch',
                      fieldIcon: Icons.work,
                      labelText: 'Branch Name',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 4,
                        highLimit: 24,
                      ),
                    ),
                    // PHONE
                    _buildTextField(
                      keyName: 'phone',
                      keyboardType: TextInputType.number,
                      fieldIcon: Icons.phone,
                      labelText: 'Phone Number',
                      validator: (inputVal) => _validateInput(
                          inputVal: inputVal!,
                          shouldCheckContains: false,
                          lowLimit: 10,
                          highLimit: 14),
                    ),
                    // EMAIL
                    _buildTextField(
                      keyName: 'email',
                      keyboardType: TextInputType.emailAddress,
                      fieldIcon: Icons.email,
                      labelText: 'Email',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: true,
                        lowLimit: 10,
                        highLimit: 40,
                        stringToCheckContains: '@',
                        shouldContain: true,
                      ),
                    ),
                    // ADDRESS
                    _buildTextField(
                      keyName: 'address',
                      fieldIcon: Icons.location_city,
                      labelText: 'Address',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 10,
                        highLimit: 100,
                      ),
                    ),
                    // CITY
                    _buildTextField(
                      keyName: 'city',
                      fieldIcon: Icons.place,
                      labelText: 'City',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 3,
                        highLimit: 30,
                      ),
                    ),
                    // REGION
                    _buildTextField(
                      keyName: 'region',
                      fieldIcon: Icons.place_outlined,
                      labelText: 'Region',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 5,
                        highLimit: 40,
                      ),
                    ),
                    // USERNAME
                    _buildTextField(
                      keyName: 'username',
                      fieldIcon: Icons.person,
                      labelText: 'Username',
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 4,
                        highLimit: 25,
                      ),
                    ),
                    // PASSWORD
                    _buildTextField(
                      keyName: 'password',
                      fieldIcon: Icons.password,
                      labelText: 'Password',
                      controller: _passController,
                      obscureText: true,
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 8,
                        highLimit: 40,
                        willConfirmPassword: true,
                        passTxt: _passController.text,
                        confirmPassTxt: _passConfirmController.text,
                      ),
                    ),
                    // CONFIRM PASSWORD
                    _buildTextField(
                      keyName: 'confPassword',
                      fieldIcon: Icons.password,
                      labelText: 'Confirm Password',
                      controller: _passConfirmController,
                      obscureText: true,
                      validator: (inputVal) => _validateInput(
                        inputVal: inputVal!,
                        shouldCheckContains: false,
                        lowLimit: 8,
                        highLimit: 40,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Have an account?",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed(LoginScreen.routeName);
                          },
                          child: const Text(
                            'Log in',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    child: IconButton(
                      icon: const Icon(Icons.login),
                      onPressed: _saveUser,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
