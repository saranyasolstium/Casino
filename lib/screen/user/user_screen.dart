// user_screen.dart

import 'package:casino_web_app/res/font_style/style.dart';
import 'package:casino_web_app/widget/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../res/colors/app_color.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.only(left: 20.0, top: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showAddUserDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.btnColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: Text(
                    '+ Add User',
                    style: GoogleFonts.roboto(color: Colors.white),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                    padding: const EdgeInsets.all(20),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      elevation: 5,
                      child: Container(
                        padding: const EdgeInsets.all(20.0),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: DataTable(
                          dividerThickness: 0,
                          columns: [
                            DataColumn(
                                label: Text('S.No',
                                    style: zzRegularBlackTextStyle10)),
                            DataColumn(
                                label: Text('Name',
                                    style: zzRegularBlackTextStyle12)),
                            DataColumn(
                                label: Text('User ID',
                                    style: zzRegularBlackTextStyle12)),
                            DataColumn(
                                label: Text('Role',
                                    style: zzRegularBlackTextStyle12)),
                            DataColumn(
                                label: Text('Phone number',
                                    style: zzRegularBlackTextStyle12)),
                            DataColumn(
                                label: Text('Password',
                                    style: zzRegularBlackTextStyle12)),
                            DataColumn(
                                label: Text('Actions',
                                    style: zzRegularBlackTextStyle12)),
                          ],
                          rows: [
                            DataRow(
                              color: MaterialStateColor.resolveWith(
                                  (states) => Colors.white),
                              cells: [
                                DataCell(Text('1',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('John Doe',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('123456789',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text(
                                  'Staff',
                                  style: zzRegularBlackTextStyle14,
                                )),
                                DataCell(Text('65432109',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Loremipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.btnColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.edit,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle edit action
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(
                                          Icons.delete,
                                          size: 10,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          // Handle delete action
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) =>
                                  AppColors
                                      .background), // Grey background color
                              cells: [
                                DataCell(Text('2',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Lorem ipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('123456788',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text(
                                  'Staff',
                                  style: zzRegularBlackTextStyle14,
                                )),
                                DataCell(Text('65789043',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Loremipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.btnColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.edit,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle edit action
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle delete action
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) =>
                                  Colors.white), // White background color
                              cells: [
                                DataCell(Text('3',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Lorem ipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('123456787',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text(
                                  'Admin',
                                  style: zzRegularBlackTextStyle14,
                                )),
                                DataCell(Text('65437896',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Loremipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.btnColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.edit,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle edit action
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle delete action
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) =>
                                  AppColors
                                      .background), // Grey background color
                              cells: [
                                DataCell(Text('4',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Lorem ipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('123456788',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text(
                                  'Staff',
                                  style: zzRegularBlackTextStyle14,
                                )),
                                DataCell(Text('65789043',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Loremipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.btnColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.edit,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle edit action
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle delete action
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),
                            DataRow(
                              color: MaterialStateColor.resolveWith((states) =>
                                  Colors.white), // White background color
                              cells: [
                                DataCell(Text('5',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Lorem ipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('123456787',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text(
                                  'Master admin',
                                  style: zzRegularBlackTextStyle14,
                                )),
                                DataCell(Text('65437896',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Text('Loremipsum',
                                    style: zzRegularBlackTextStyle14)),
                                DataCell(Row(
                                  children: [
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: AppColors.btnColor,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.edit,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle edit action
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.delete,
                                            size: 10, color: Colors.white),
                                        onPressed: () {
                                          // Handle delete action
                                        },
                                      ),
                                    ),
                                  ],
                                )),
                              ],
                            ),

                            // Add more DataRow widgets for additional users
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showAddUserDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController userIDController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController roleController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text(
            "Add User",
            textAlign: TextAlign.center,
            style:
                zzRegularBlackTextStyle20.copyWith(fontWeight: FontWeight.bold),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style: zzRegularBlackTextStyle14,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 300,
                          child: TextField(
                            controller: nameController,
                            decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: AppColors.textfieldBg,
                              hintText: 'Enter name',
                              hintStyle: zzRegularBlackTextStyle14,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey[400] ?? Colors.transparent,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:
                                        Colors.grey[400] ?? Colors.transparent,
                                    width: 1.0),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'User ID',
                          style: zzRegularBlackTextStyle14,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: userIDController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: AppColors.textfieldBg,
                            hintText: 'Enter number',
                            hintStyle: zzRegularBlackTextStyle14,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[400] ?? Colors.transparent,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[400] ?? Colors.transparent,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phone Number',
                          style: zzRegularBlackTextStyle14,
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.grey[400] ?? Colors.transparent,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(4)),
                              color: AppColors.textfieldBg),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Text("+65")),
                              Container(
                                  height: 50,
                                  width: 1,
                                  decoration:
                                      BoxDecoration(color: Colors.grey[400])),
                              Expanded(
                                child: TextFormField(
                                  autofocus: false,
                                  controller: phoneController,
                                  style: zzRegularBlackTextStyle14,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  keyboardType: TextInputType.number,
                                  maxLength: 10,
                                  decoration: InputDecoration(
                                    counter: const SizedBox(height: 0.0),
                                    border: InputBorder.none,
                                    hintText: 'Enter mobile number',
                                    hintStyle: zzRegularBlackTextStyle14,
                                    filled: true,
                                    fillColor: AppColors.textfieldBg,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Password',
                          style: zzRegularBlackTextStyle14,
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            filled: true,
                            fillColor: AppColors.textfieldBg,
                            hintText: 'Enter password',
                            hintStyle: zzRegularBlackTextStyle14,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[400] ?? Colors.transparent,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey[400] ?? Colors.transparent,
                                  width: 1.0),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Role',
                          style: zzRegularBlackTextStyle14,
                        ),
                        const SizedBox(height: 10),
                        CustomDropdownButton(
                          value: 'Select',
                          items: const [
                            DropdownMenuItem(
                              value: 'Select',
                              child: Text('Select'),
                            ),
                            DropdownMenuItem(
                              value: 'Admin',
                              child: Text('Admin'),
                            ),
                            DropdownMenuItem(
                              value: 'Master',
                              child: Text('Master'),
                            ),
                            DropdownMenuItem(
                              value: 'Staff',
                              child: Text('Staff'),
                            ),
                          ],
                          onChanged: (value) {
                            // Handle the change of value here if needed
                            print('Selected room: $value');
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 30),
                  const Flexible(
                    flex: 1,
                    child: SizedBox(
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.accentColor,
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: AppColors.btnColor),
                      ),
                    ),
                    child: const Text(
                      'Cancel',
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: GoogleFonts.roboto(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ],
        );
      },
    );
  }
}
