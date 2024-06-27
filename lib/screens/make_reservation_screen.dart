import 'package:flutter/material.dart';
import 'package:healthcare/models/restaurants.dart';



class MakeReservationScreen extends StatefulWidget {
  final Restaurant restaurant;

  const MakeReservationScreen({super.key, required this.restaurant});


  @override
  State<MakeReservationScreen> createState() => _MakeReservationScreenState();
}

class _MakeReservationScreenState extends State<MakeReservationScreen> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orangeAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }


  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.orangeAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            dialogBackgroundColor: Colors.white,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }


  void _confirmReservation(BuildContext context) {
    if (_selectedDate != null && _selectedTime != null) {
      final String reservationDate =
          '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}';
      final String reservationTime = _selectedTime!.format(context);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              'Reserva Confirmada',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25.0,
              ),
            ),
            content: Text(
              'Data: $reservationDate\nHora: $reservationTime',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );

        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faça uma reserva",),
        backgroundColor: Color(0xFFFFB300),
      ),
      backgroundColor: Color(0xFFFFB300),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 5.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    minRadius: 50,
                    maxRadius: 50,
                    backgroundImage: AssetImage("images/${widget.restaurant.imagePath}"),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.restaurant.name,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 25),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 20,
                      left: 15,
                      right: 15,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Column(
                          children: [
                            SizedBox(height: 45),
                            Text(
                              "Selecione a data da sua reserva",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 22, color: Colors.black),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.amber,
                                side: BorderSide(color: Colors.black, width: 2),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                              ),
                              onPressed: () => _selectDate(context),
                              child: Text(
                                _selectedDate == null
                                    ? 'Selecionar Data'
                                    : 'Data: ${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                              ),
                            ),

                          ],
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              Text(
                                "Selecione a hora sua reserva",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.amber,
                                  side: BorderSide(color: Colors.black, width: 2),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 110),
                                ),
                                onPressed: () => _selectTime(context),
                                child: Text(
                                  _selectedTime == null
                                      ? 'Selecionar Hora'
                                      : 'Hora: ${_selectedTime!.format(context)}',
                                ),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(height: 250.0),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 130,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          children: [
            SizedBox(height: 15),
            InkWell(
              onTap: () => _confirmReservation(context),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xFFFFB300),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Confirmar reserva",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
