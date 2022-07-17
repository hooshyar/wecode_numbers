import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:wecode_numbers/src/services/numbers_service.dart';

class NumbersScreen extends StatefulWidget {
  NumbersScreen({Key? key}) : super(key: key);

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  Services serv = new Services();

  TextEditingController _numberController = TextEditingController();

  @override
  build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Numbers',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
            SizedBox(height: 20),
            Text(
                'the text controller text : ${_numberController.text ?? null}'),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _numberController,
                      decoration: InputDecoration(
                          hintText: "Number Input ",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {});
                        },
                        icon: Icon(Icons.search),
                        label: Text('Search')),
                  ),
                ],
              ),
            ),
            _numberController.value.text == ''
                ? Container(
                    child: Text('Hello'),
                  )
                : Container(
                    height: 200,
                    width: 350,
                    child: FutureBuilder<String>(
                        future: serv.getNumberInformation(
                            _numberController.value.text == ''
                                ? '100'
                                : _numberController.value.text),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Text('Loading...');
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.data == null) {
                            return Text('No data');
                          }
                          return Column(
                            children: [
                              SizedBox(height: 20),
                              Text('${snapshot.data}',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black))
                            ],
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
