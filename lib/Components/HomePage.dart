// import 'package:app/Components/Signup.dart';
// import 'package:flutter/material.dart';
// import 'package:app/Components/LoginWithEmail.dart';
// import 'package:app/Components/LoginWithGoogle.dart';

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,

//       body: Container(
//         decoration: BoxDecoration(
//           color: const Color.fromARGB(255, 245, 245, 245),
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black,
//               offset: Offset.zero,
//               blurRadius: 1.0,
//               spreadRadius: 1.0,
//               blurStyle: BlurStyle.outer,
//             ),
//           ],
//         ),
//         margin: EdgeInsets.symmetric(horizontal: 20, vertical: 250),
//         child: Center(
//           child: Padding(
//             padding: EdgeInsets.all(20),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "SIGN IN",
//                   style: TextStyle(
//                     fontSize: 58,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//                 SizedBox(height: 40),


//                 // Email Signup Button
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginWithEmail(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                       backgroundColor: Colors.blue[100],
//                     ),
//                     child: Text("SIGN IN WITH EMAIL"),
//                   ),
//                 ),

//                 // Divider with OR
//                 Row(
//                   children: [
//                     Expanded(child: Divider(thickness: 1)),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       child: Text("OR"),
//                     ),
//                     Expanded(child: Divider(thickness: 1)),
//                   ],
//                 ),

//                 // Google Signup Button
//                 Container(
//                   margin: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => LoginWithGoogle(),
//                         ),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(double.infinity, 50),
//                       backgroundColor: Colors.blue[100],
//                     ),
//                     child: Text("SIGN IN WITH GOOGLE"),
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("Create an account? "),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));
//                       },
//                       child: Text(
//                         "Sign up",
//                         style: TextStyle(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
