import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _InputsState createState() => _InputsState();
// }

// class _InputsState extends State<MyApp> {
//   late TextEditingController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter App',
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('SignUp'),
//           ),
//           body: Container(
//             key: _doneKey,

//           // margin: EdgeInsets.all(16),

//             child: ListView(

//             padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),

//             children: [
//             Container(
//               child: TextField(
//                 // controller: _controller,
//                 maxLines: 1,

//                 decoration: InputDecoration(
//                     border: UnderlineInputBorder(), labelText: 'Username'),
//               ),
//             ),
//             TextField(
//               // controller: _controller,
//               maxLines: 1,
//               obscureText: true,
//               decoration: InputDecoration(
//                   border: UnderlineInputBorder(), labelText: 'Password'),
//             ),
//             TextField(
//               // controller: _controller,
//               maxLines: 1,
//               keyboardType: TextInputType.emailAddress,
//               decoration: InputDecoration(
//                   border: UnderlineInputBorder(), labelText: 'Email'),
//             ),

//             // dropdown list

//             // Container(
//             //   padding: const EdgeInsets.all(8),
//             //   child: DropdownButton(
//             //   value: dropdownValue,
//             //   icon: const Icon(Icons.arrow_downward),
//             //   iconSize: 16,
//             //   elevation: 16,
//             //   style: const TextStyle(color: Colors.deepPurple),
//             //   underline: Container(
//             //   height: 2,
//             //   color: Colors.deepPurpleAccent,
//             // ),
//             //   onChanged: (String? newValue) {
//             //   setState(() {
//             //   dropdownValue = newValue!;
//             //   });
//             //   },
//             //         items: <String>['Male', 'Female', 'Others', 'Free']
//             //             .map<DropdownMenuItem<String>>((String value) {
//             //           return DropdownMenuItem<String>(
//             //             value: value,
//             //             child: Text(value),
//             //           );
//             //         }).toList(),
//             //       ),
//             //     ),

//             // button onSubmit
//                 Container(
//                   padding: const EdgeInsets.all(8),
//                   child: ElevatedButton(
//                     child: const Text('Submit'),
//                     onPressed: () {
//                       if (_doneKey.currentState!.validate()) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content: Text('Successfully Signed Up!'),
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 )

//             ],

//             )

//           )),
//     );
//   }
// }

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SignUp(title: 'Hhello'));
  }
}

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue = 'Select Your Gender';
  String Name = '';
  String Email = '';
  String Password = '';

  final String _imageUrl =
      'https://as1.ftcdn.net/v2/jpg/03/67/35/72/1000_F_367357209_BG07SVnnB4HSHSaMiHajfZhrZZAE859A.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Sign up page')),
        body: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                const Text(
                  'Glad To Have You',
                  style: TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.center,
                ),

                Image(
                  image: NetworkImage('https://media.istockphoto.com/photos/on-colourful-speech-bubbles-picture-id180819641?b=1&k=20&m=180819641&s=170667a&w=0&h=CX51cRVofQl95e_cu9Bfy5PLZQ1WdsqmJ-NCFzU96UI='),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'No Name Presented';
                      }
                      return null;
                    },
                    onChanged: (String? value) {
                      setState(() {
                        Name = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'No Email Presented';
                      } else if (value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return 'Enter a valid email!';
                      }
                      return null;
                    },
                    onChanged: (String? value) {
                      setState(() {
                        Email = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: UnderlineInputBorder(),
                      suffixIcon: Icon(
                        Icons.error,
                      ),
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'No Password Presented';
                      }
                      return null;
                    },
                    onChanged: (String? value) {
                      setState(() {
                        Password = value!;
                      });
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: DropdownButton(
                    hint: Text('Select your gender'),
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 16,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>[
                      'Select Your Gender',
                      'Male',
                      'Female',
                      'Others',
                      'Rather no say'
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: ElevatedButton(
                    child: const Text('SignUp'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Successfully Signed Up!'),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            )));
  }
}


