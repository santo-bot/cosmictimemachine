import 'package:cosmictimemachine/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../snippets/containers/mainbottomnavigationbar.dart';

class TimeTravelPage extends StatefulWidget {
  @override
  State<TimeTravelPage> createState() => _TimeTravelPageState();
}

class _TimeTravelPageState extends State<TimeTravelPage> {
  DateTime selectedDate = DateTime.now();
  TextEditingController coordinatesController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  Map<String, dynamic>? nasaData;
  bool loading = false;

  _pickDate() async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      setState(() => selectedDate = date);
    }
  }

  _fetchImage() async {
    if (coordinatesController.text.isEmpty) return;
    setState(() => loading = true);
    try {
      final data = await ApiService.fetchNasaImage(
        DateFormat('yyyy-MM-dd').format(selectedDate),
        coordinatesController.text,
      );
      setState(() => nasaData = data);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
    setState(() => loading = false);
  }

  _postMessage() async {
    if (messageController.text.isEmpty || nameController.text.isEmpty) return;
    try {
      await ApiService.postMessage(
        nameController.text,
        messageController.text,
        DateFormat('yyyy-MM-dd').format(selectedDate),
        coordinatesController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Message sent!")));
      messageController.clear();
      nameController.clear();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNav(),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Your Name"),
            ),
            TextField(
              controller: coordinatesController,
              decoration: InputDecoration(labelText: "Sky Coordinates (RA, DEC)"),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text("Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}"),
                Spacer(),
                ElevatedButton(onPressed: _pickDate, child: Text("Pick Date")),
              ],
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _fetchImage, child: Text("Fetch NASA Image")),
            SizedBox(height: 20),
            if (loading) Center(child: CircularProgressIndicator()),
            if (nasaData != null) ...[
              Image.network(nasaData!['url'] ?? ''),
              SizedBox(height: 10),
              Text("Title: ${nasaData!['title'] ?? 'Unknown'}"),
              Text("Explanation: ${nasaData!['explanation'] ?? ''}"),
              Text("Coordinates: ${nasaData!['coordinates']}"),
            ],
            SizedBox(height: 20),
            TextField(
              controller: messageController,
              decoration: InputDecoration(labelText: "Message to the Past"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _postMessage, child: Text("Send Message")),
          ],
        ),
      ),
    );
  }
}
