import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streamt/view/colors/colors.dart';
import 'package:streamt/view/loginpage.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({super.key});

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(4, (index) => TextEditingController());
  final List<bool> _isFilled = List.generate(4, (index) => false);

  @override
  void dispose() {
    for (var focusNode in _focusNodes) {
      focusNode.dispose();
    }
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Movie Detail'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20,
        ),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verification code',
                style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
              ),
              Text(
                'We have sent the verification code \nto your email address',
                style: TextStyle(color: Colors.grey, fontSize: 15),
              ),
              SizedBox(height: 20,),
              Form(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) => _buildOtpTextField(index)),
                ),
              ),
         Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 55,
                    width: 120,
                    child: ElevatedButton(style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          
                      backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 0, 0))
                    ),
                      onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (Builder)=>home()));
                      }, child: Center(
                      child: Text('Resend'),
                    ) ),
                  ),
          
                   SizedBox(
                    height: 55,
                    width: 120,
                    child: ElevatedButton(style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          
                      backgroundColor:  MaterialStateProperty.all<Color>(const Color.fromARGB(255, 255, 0, 0))
                    ),
                      onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (Builder)=>home()));
                      }, child: Center(
                      child: Text('Confirm'),
                    ) ),
                  )
                ],
              )
          
          
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpTextField(int index) {
    return SizedBox(
      height: 68,
      width: 64,
      child: TextFormField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        onChanged: (value) {
          setState(() {
            _isFilled[index] = value.isNotEmpty;
          });
          if (value.length == 1) {
            if (index != 3) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            } else {
              _focusNodes[index].unfocus();
            }
          }
        },
        style: Theme.of(context).textTheme.headlineLarge,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 0, 0)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: const Color.fromARGB(255, 255, 0, 0)),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 255, 0, 0)),
          ),
          filled: true,
          fillColor: _isFilled[index] ? Color.fromARGB(255, 255, 0, 0) : Colors.black,
        ),
      ),
    );
  }
}
