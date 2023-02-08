import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OtpForm extends StatefulWidget {
  
  const OtpForm({super.key});

  @override
  State<OtpForm> createState() => _OtpState();
}

class _OtpState extends State<OtpForm> {
   
  @override
  Widget build(BuildContext context) {
    String  _ping1,_ping2,ping3,_ping4;
    return Form(
      child: Row(
        children: [
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if(value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1){setState(() {
                //_ping1 = pin1;
              });},
              decoration: InputDecoration(hintText: "0",hintStyle: TextStyle(color: Colors.grey.withOpacity(0.2))),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if(value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin2){},
              decoration: InputDecoration(hintText: "0",hintStyle: TextStyle(color: Colors.grey.withOpacity(0.2))),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if(value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin3){},
              decoration: InputDecoration(hintText: "0",hintStyle: TextStyle(color: Colors.grey.withOpacity(0.2))),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
          SizedBox(
            height: 68,
            width: 64,
            child: TextFormField(
              onChanged: (value) {
                if(value.length == 1){
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin4){},
              decoration: InputDecoration(hintText: "0",hintStyle: TextStyle(color: Colors.grey.withOpacity(0.2))),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Verification",style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.w600),),
          Text("We have sent the code verification to",style: TextStyle(color: Colors.grey.shade600),),
          Row(
            children: const[
              Text("+905511593434",style: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold),),
              Text("Change phone number?",style: TextStyle(color: Colors.purple,fontSize: 13),),
            ],
          ),
          const OtpForm(),
          const SizedBox(height: 300,),
          Row(
            children: [
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(elevation: 4,),
                child: const Text("Resend",style: TextStyle(color: Colors.purple,backgroundColor: Colors.white),)
              ),
               ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(elevation: 4,),
                child: const Text("Confirm",style: TextStyle(color: Colors.white,backgroundColor: Colors.purple),)
              ),
            ],
          )
        ],
      ),
    );
  }
}