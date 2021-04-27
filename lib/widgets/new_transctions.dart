import 'package:flutter/material.dart';

class NewTrasnctions extends StatefulWidget {
  final Function addTx;

  NewTrasnctions(this.addTx);

  @override
  _NewTrasnctionsState createState() => _NewTrasnctionsState();
}

class _NewTrasnctionsState extends State<NewTrasnctions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.addTx(enteredTitle, enteredAmount);

    Navigator.of(context)
        .pop(); //This will close the modal after adding a new data.
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              autofocus: true,
              onSubmitted: (_) => submitData,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              autofocus: true,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
