import "package:flutter/material.dart";
import "package:project_mobile/halamanutama.dart";

class DesainHalamanLogin extends StatefulWidget {
  const DesainHalamanLogin({super.key});

  @override
  State<DesainHalamanLogin> createState() => _DesainHalamanLoginState();
}

class _DesainHalamanLoginState extends State<DesainHalamanLogin> {
  TextEditingController cUser = TextEditingController();
  TextEditingController cPass = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Center(
          child: Container(
            width: 250, height: 250,
            child: Card(
              color: const Color.fromARGB(255, 147, 197, 237),
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TextFormField(
                      controller: cUser,
                      decoration: InputDecoration(
                        labelText: 'User Name',
                        hintText: 'Input User Name',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'User Name Masih Kosong';
                        }return null;
                      },
                    ),

                    const SizedBox(height: 15,),

                    TextFormField(
                      obscureText: true,
                      controller: cPass,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Input Password',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        )
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password Masih Kosong';
                        }return null;
                      },
                    ),
                    //Buttom

                    const SizedBox(height: 25,),
                    ElevatedButton(
                      onPressed: (){
                        String tUser = 'admin';
                        String tPass = '1234';
                        if (formkey.currentState!.validate()){
                          if (cUser.text == tUser && cPass.text == tPass) {
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DesainHalamanUtama(),), (route)=> false);
                          } else {
                            showDialog(
                              context: context, 
                              builder: (context){
                                return AlertDialog(
                                  title: Text('Konfirmasi Login'),
                                  content: Text('User atau Password Masih Salah'),
                                  actions: [
                                    ElevatedButton(
                                      onPressed: (){
                                        cUser.text='';
                                        cPass.text='';
                                        Navigator.of(context).pop();

                                      }, 
                                      child: Text('OK')
                                      )
                                  ],
                                );
                              });
                          }
                        }
                      },
                      child: Text('LOGIN') 
                      )
                  ],
                ),
              ),
            ),
          ),
        )
        ),
    );
  }
}
