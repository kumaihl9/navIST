import 'package:flutter/material.dart';
import 'nav.dart';

class FormTwo extends StatefulWidget {
  @override
  _FormTwoState createState() => _FormTwoState();
}

class _FormTwoState extends State<FormTwo> {
  final TextEditingController _messageController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  final double minValue = 8.0;
  final _feedbackTypeList = <String>["Comments", "Bugs", "Questions"];

  String _feedbackType = "";

  final TextStyle _errorStyle = TextStyle(
    color: Colors.red,
    fontSize: 16.6,
  );

  @override
  initState() {
    _feedbackType = _feedbackTypeList[0];
    super.initState();
  }

  Widget _buildAssetHeader() {
    return Container(
      width: double.maxFinite,
      height: 230.0,
      child: Container(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/feedback.png"),
              fit: BoxFit.cover)),
    );
  }

  Widget _buildCategory() {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: minValue * 2, horizontal: minValue * 3),
      child: Row(
        children: <Widget>[
          Text(
            "Select feedback type",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: minValue * 2,
          ),
          Expanded(
              child: Align(
            alignment: Alignment.centerRight,
          ))
        ],
      ),
    );
  }

  Widget _buildName() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      child: TextFormField(
        controller: _nameController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            contentPadding:
                EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
            hintText: 'Full Name',
            labelText: 'Full Name',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  Widget _buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      child: TextFormField(
        controller: _emailController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            contentPadding:
                EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
            hintText: 'Email',
            labelText: 'Email',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: minValue * 3),
      child: TextFormField(
        controller: _messageController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            errorStyle: _errorStyle,
            contentPadding:
                EdgeInsets.symmetric(vertical: minValue, horizontal: minValue),
            hintText: 'Description',
            labelText: 'Description',
            labelStyle: TextStyle(fontSize: 16.0, color: Colors.black87)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios, color: Colors.grey),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
        elevation: 1,
        title: Text(
          "Leave feedback",
          style: TextStyle(color: Colors.black87),
        ),
        actions: <Widget>[
          TextButton(onPressed: () => null, child: Text("POST"))
        ],
      ),
      body: ListView(
        children: <Widget>[
          _buildAssetHeader(),
          _buildCategory(),
          SizedBox(
            height: minValue,
          ),
          _buildName(),
          SizedBox(
            height: minValue * 3,
          ),
          _buildEmail(),
          SizedBox(
            height: minValue * 3,
          ),
          _buildDescription(),
          SizedBox(
            height: minValue * 3,
          ),
        ],
      ),
    );
  }
}
