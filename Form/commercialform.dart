// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:u2app/widgets/featurecheck.dart';
import 'package:u2app/widgets/drpbtnform.dart';
import 'package:u2app/widgets/horitext.dart';
import 'package:u2app/widgets/txtfield.dart';

class PropertyRentForm extends StatefulWidget {
  const PropertyRentForm({super.key, required this.title});
  final String title;

  @override
  _PropertyRentFormState createState() => _PropertyRentFormState();
}

class _PropertyRentFormState extends State<PropertyRentForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedRoom;
  String? selectedTenant;
  List<String> listRoom = [
    "Office",
    "Retail",
    "Shop",
    "Warehouse",
    "Commercial Floor",
    "Commercial Villa",
    "Other"
  ];
  List<String> listTenant = [
    "Female",
    "Male",
    "Couple",
    "Student",
    "Families",
    "Don't mind"
  ];
  String? _rentType;
  String? _deposit;
  final List<bool> _isCheckedList = List<bool>.filled(26, false);

  void _handleCheckboxChange(int index, bool? value) {
    setState(() {
      _isCheckedList[index] = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
          child: AppBar(
            title: const Center(
              child: Text(
                'Property for Rent',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: const Color(0xFF004225),
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildDropdownButton(
                labelText: 'Type of Room',
                items: listRoom,
                selectedItem: selectedRoom,
                onChanged: (newValue) {
                  setState(() {
                    selectedRoom = newValue;
                  });
                },
              ),
              buildTextFormField('Description',
                  maxLines: 3, hintText: 'Details about the property'),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 221, 221, 221),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(16),
                  maximumSize: const Size.fromHeight(50), // Set height to 50
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.camera_alt, color: Colors.grey),
                    SizedBox(width: 8),
                    Text(
                      'Add Images',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const Center(
                child: Text('*Minimum 3 images',
                    style: TextStyle(color: Colors.red)),
              ),
              buildTextFormField('Address',
                  hintText: 'District, City, Street name/no'),
              Container(
                height: 150,
                color: Colors.grey[300],
                child: const Center(child: Text('Map Placeholder')),
              ),
              const Text('Room Details'),
              horitxt('Number od Bathrooms', hintText: ' '),
              const SizedBox(height: 5),
              horitxt('Number of Bedrooms', hintText: ''),
              const SizedBox(height: 5),
              horitxt('Number of Kitchen/Dining', hintText: ''),
              const SizedBox(height: 40),
              const Text('Rent Details'),
              Row(
                children: [
                  Radio<String>(
                    value: 'Fixed Price',
                    groupValue: _rentType,
                    onChanged: (String? value) {
                      setState(() {
                        _rentType = value;
                      });
                    },
                  ),
                  const Text('Fixed Price'),
                  const SizedBox(width: 40),
                  Radio<String>(
                    value: 'Offer',
                    groupValue: _rentType,
                    onChanged: (String? value) {
                      setState(() {
                        _rentType = value;
                      });
                    },
                  ),
                  const Text('Put up for an offer'),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              if (_rentType == 'Fixed Price') ...[
                horitxt('Amount', hintText: ''),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Monthly',
                      groupValue: _deposit,
                      onChanged: (String? value) {
                        setState(() {
                          _deposit = value;
                        });
                      },
                    ),
                    const Text('Monthly'),
                    const SizedBox(width: 65),
                    Radio<String>(
                      value: 'Yearly',
                      groupValue: _deposit,
                      onChanged: (String? value) {
                        setState(() {
                          _deposit = value;
                        });
                      },
                    ),
                    const Text('Yearly'),
                  ],
                ),
              ] else if (_rentType == 'Offer') ...[
                horitxt('Minimum Amount', hintText: ''),
                Row(
                  children: [
                    Radio<String>(
                      value: 'Monthly',
                      groupValue: _deposit,
                      onChanged: (String? value) {
                        setState(() {
                          _deposit = value;
                        });
                      },
                    ),
                    const Text('Monthly'),
                    const SizedBox(width: 65),
                    Radio<String>(
                      value: 'Yearly',
                      groupValue: _deposit,
                      onChanged: (String? value) {
                        setState(() {
                          _deposit = value;
                        });
                      },
                    ),
                    const Text('Yearly'),
                  ],
                ),
              ],
              Row(
                children: [
                  const Text('Security Deposit'),
                  Radio<String>(
                    value: 'Yes',
                    groupValue: _deposit,
                    onChanged: (String? value) {
                      setState(() {
                        _deposit = value;
                      });
                    },
                  ),
                  const Text('Yes'),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: 'No',
                    groupValue: _deposit,
                    onChanged: (String? value) {
                      setState(() {
                        _deposit = value;
                      });
                    },
                  ),
                  const Text('No'),
                ],
              ),
              if (_deposit == 'Yes') ...[
                horitxt('Amount', hintText: ''),
              ] else if (_deposit == 'No')
                ...[],
              buildTextFormField('Moving out notice period',
                  hintText: 'Enter notice period'),
              const Text('Availability',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              horitxt('Start Date:', hintText: ''),
              const SizedBox(height: 5),
              horitxt('Maximum Stay', hintText: ''),
              const SizedBox(height: 5),
              horitxt('Minimum Stay', hintText: ''),
              const SizedBox(height: 5),
              buildDropdownButton(
                labelText: 'Type of Tenants',
                items: listTenant,
                selectedItem: selectedTenant,
                onChanged: (newValue) {
                  setState(() {
                    selectedTenant = newValue;
                  });
                },
              ),
              horitxt('Number of Tenants', hintText: ''),
              const SizedBox(height: 15),
              const Text('Facilities',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const Text('Utilities:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                checkBox('Stable Electricity', isChecked: _isCheckedList[0],
                    onChanged: (bool? value) {
                  _handleCheckboxChange(0, value);
                }),
                const SizedBox(
                  width: 5,
                ),
                checkBox('Good Water Supply', isChecked: _isCheckedList[1],
                    onChanged: (bool? value) {
                  _handleCheckboxChange(1, value);
                }),
              ]),
              const SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                checkBox('Garbage Disposal', isChecked: _isCheckedList[2],
                    onChanged: (bool? value) {
                  _handleCheckboxChange(2, value);
                }),
                const SizedBox(
                  width: 5,
                ),
                checkBox('Internet/Wifi', isChecked: _isCheckedList[3],
                    onChanged: (bool? value) {
                  _handleCheckboxChange(3, value);
                }),
              ]),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('TV Cable', isChecked: _isCheckedList[4],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(4, value);
                  }),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Room Amenities:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Bed', isChecked: _isCheckedList[5],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(5, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('Installed bulbs', isChecked: _isCheckedList[6],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(6, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('Balcony', isChecked: _isCheckedList[7],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(7, value);
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Balcony', isChecked: _isCheckedList[8],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(8, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('Fully Furnished', isChecked: _isCheckedList[9],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(9, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('A/C', isChecked: _isCheckedList[10],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(10, value);
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Attached Bathroom', isChecked: _isCheckedList[11],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(11, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('Closet/Wardrobe', isChecked: _isCheckedList[12],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(12, value);
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Kitchen Appliances', isChecked: _isCheckedList[13],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(13, value);
                  }),
                ],
              ),
              const SizedBox(height: 10),
              const Text('Building Amenities:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Near Laundromat', isChecked: _isCheckedList[14],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(14, value);
                  }),
                  const SizedBox(width: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      checkBox('Near Gym', isChecked: _isCheckedList[15],
                          onChanged: (bool? value) {
                        _handleCheckboxChange(15, value);
                      }),
                      const SizedBox(width: 5),
                      checkBox('Parking', isChecked: _isCheckedList[16],
                          onChanged: (bool? value) {
                        _handleCheckboxChange(16, value);
                      }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Near Pool', isChecked: _isCheckedList[17],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(17, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('Near Park', isChecked: _isCheckedList[18],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(18, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('Security', isChecked: _isCheckedList[19],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(19, value);
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('Near Bus stop', isChecked: _isCheckedList[20],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(20, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('4ft. path', isChecked: _isCheckedList[21],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(21, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('6ft. path', isChecked: _isCheckedList[22],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(22, value);
                  }),
                ],
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  checkBox('8ft. path', isChecked: _isCheckedList[23],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(23, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('10ft. path', isChecked: _isCheckedList[24],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(24, value);
                  }),
                  const SizedBox(width: 5),
                  checkBox('12ft. path', isChecked: _isCheckedList[25],
                      onChanged: (bool? value) {
                    _handleCheckboxChange(25, value);
                  }),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form submission logic
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF004225),
                  foregroundColor: Colors.white, // Set the text color to white
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7), // No border radius
                  ),
                ),
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
