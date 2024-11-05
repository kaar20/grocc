import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grocc/app/modules/auth/views/auth_view.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Add intl_phone_field to pubspec.yaml
import '../controllers/auth_controller.dart';

class Phone extends GetView<AuthController> {
  const Phone({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Phone Page'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Instruction Text
              const Text(
                'Welcome! What’s your mobile number?',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                'With a valid number, you can access rides, deliveries, and our other services.',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              
              // Phone Input Field with Country Code Picker
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Mobile Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'US', // Set a default country code if needed
                onChanged: (phone) {
                  controller.phoneNumber.value = phone.completeNumber;
                },
              ),
              
              const SizedBox(height: 20),
              
              // Next Button
           
                
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 55,
                        width: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: 
                                //  Colors.blue,
                                 Colors.grey,
                            // padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                          ),
                          onPressed:  () {
                            Get.to(const AuthView());
                                  // Handle Next Action
                                },
                         
                          child: const Text('Next', style: TextStyle(color: Colors.white,fontSize: 20)),
                        ),
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
