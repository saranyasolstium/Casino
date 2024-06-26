import 'package:flutter/material.dart';
import 'package:casino_web_app/res/colors/app_color.dart';
import 'package:casino_web_app/res/font_style/style.dart';
import 'package:casino_web_app/widget/dropdown.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final ScrollController _scrollController = ScrollController();

  List<TextEditingController> controllers = [];

  List<FocusNode> focusNodes = [];

  bool isStartVisible = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 15, vsync: this);
  }

  void _setFocus(int index) {
    for (int i = 0; i < focusNodes.length; i++) {
      if (i == index) {
        focusNodes[i].requestFocus();
      } else {
        focusNodes[i].unfocus();
      }
    }
  }

  void _onTextChanged() {
    // Ensure UI updates when text changes
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: _buildTabBar(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Visibility(
                              visible: isStartVisible,
                              child: Row(children: [
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: AppColors.btnColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Start'),
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  flex: 1,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.red[500],
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Stop'),
                                  ),
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Visibility(
                              visible: !isStartVisible,
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor: Colors.white,
                                    backgroundColor: AppColors.btnColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                  child: const Text('Go to new draw'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "Draw number",
                                style: zzRegularBlackTextStyle18,
                              ),
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
                                  value: '01',
                                  child: Text('01'),
                                ),
                                DropdownMenuItem(
                                  value: '02',
                                  child: Text('02'),
                                ),
                                DropdownMenuItem(
                                  value: '03',
                                  child: Text('03'),
                                ),
                              ],
                              onChanged: (value) {
                                print('Selected room: \$value');
                              },
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Text(
                                  'Serial no. ',
                                  style: zzRegularBlackTextStyle18,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      controllers.add(TextEditingController());
                                      focusNodes.add(FocusNode());
                                    });
                                  },
                                  child: Text(
                                    '+Add',
                                    style: zzRegularBlackTextStyle14.copyWith(
                                      decoration: TextDecoration.underline,
                                      decorationColor: AppColors.accentColor,
                                      color: AppColors.accentColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            ScrollbarTheme(
                              data: ScrollbarThemeData(
                                thumbVisibility:
                                    MaterialStateProperty.all(true),
                                thickness: MaterialStateProperty.all(5.0),
                                thumbColor: MaterialStateProperty.all(
                                    AppColors.accentColor),
                              ),
                              child: SizedBox(
                                height: 300,
                                child: ListView(
                                  controller: _scrollController,
                                  children:
                                      controllers.asMap().entries.map((entry) {
                                    int index = entry.key;
                                    TextEditingController controller =
                                        entry.value;
                                    FocusNode focusNode = focusNodes[index];

                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(height: 10),
                                            Text(
                                              'Ticket serial Number',
                                              style: zzRegularBlackTextStyle14,
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              child: TextField(
                                                controller: controller,
                                                focusNode: focusNode,
                                                onTap: () {
                                                  setState(() {
                                                    _setFocus(index);
                                                    controller.addListener(
                                                        _onTextChanged);
                                                  });
                                                },
                                                decoration: InputDecoration(
                                                  hintText:
                                                      'Enter ticket serial number',
                                                  hintStyle:
                                                      zzRegularBlackTextStyle14
                                                          .copyWith(
                                                              color:
                                                                  Colors.grey),
                                                  filled: true,
                                                  fillColor: controller
                                                          .text.isEmpty
                                                      ? (focusNode.hasFocus
                                                          ? AppColors
                                                              .enableInput
                                                          : AppColors
                                                              .background)
                                                      : AppColors.enableInput,
                                                  border:
                                                      const OutlineInputBorder(),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color: controller
                                                              .text.isEmpty
                                                          ? Colors.grey[400] ??
                                                              Colors.transparent
                                                          : AppColors
                                                              .accentColor,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide:
                                                        const BorderSide(
                                                      color:
                                                          AppColors.accentColor,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ));
                                  }).toList(),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Card(
                              elevation: 8,
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(
                                  color: Colors.grey[50] ?? Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: GridView.count(
                                  crossAxisCount: 5,
                                  crossAxisSpacing: 20.0,
                                  mainAxisSpacing: 10.0,
                                  childAspectRatio: 2 / 0.9,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  children: List.generate(
                                    24,
                                    (index) => Container(
                                        child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              'No. ',
                                              style: zzRegularBlackTextStyle14,
                                            ),
                                            Text(
                                              (index + 1).toString(),
                                              style: zzRegularBlackTextStyle18
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.textfieldBg,
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                            border: Border.all(
                                              color: Colors.grey[400] ??
                                                  Colors.transparent,
                                              width: 1.0,
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 5.0,
                                                        horizontal: 10.0),
                                                child: Text(
                                                  'Point',
                                                  style:
                                                      zzRegularBlackTextStyle14,
                                                ),
                                              ),
                                              Container(
                                                  height: 50,
                                                  width: 1,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey[400])),
                                              Expanded(
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16.0),
                                                  child: TextField(
                                                    keyboardType:
                                                        const TextInputType
                                                            .numberWithOptions(
                                                            decimal: true),
                                                    inputFormatters: <TextInputFormatter>[
                                                      FilteringTextInputFormatter
                                                          .allow(
                                                              RegExp(r'[0-9]')),
                                                    ],
                                                    decoration: InputDecoration(
                                                      hintText:
                                                          'Enter a number',
                                                      hintStyle:
                                                          zzRegularBlackTextStyle14,
                                                      enabledBorder:
                                                          InputBorder.none,
                                                      focusedBorder:
                                                          InputBorder.none,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 150,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      foregroundColor: AppColors.btnColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        side: const BorderSide(
                                            color: AppColors.btnColor),
                                      ),
                                    ),
                                    child: const Text('Cancel'),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  width: 150,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      showConfirmationDialog(context);
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: AppColors.btnColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                    child: const Text('Save'),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: !isStartVisible,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Winning no: 7",
                        style: zzRegularBlackTextStyle20.copyWith(
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isStartVisible,
                    child: Padding(
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
                                    label: Text('S.no',
                                        style: zzRegularBlackTextStyle10)),
                                DataColumn(
                                    label: Text('Ticket serial Number',
                                        style: zzRegularBlackTextStyle12)),
                                DataColumn(
                                    label: Text('Number Place',
                                        style: zzRegularBlackTextStyle12)),
                                DataColumn(
                                    label: Text('Bet Collected',
                                        style: zzRegularBlackTextStyle12)),
                                DataColumn(
                                    label: Text('Payout',
                                        style: zzRegularBlackTextStyle12)),
                                DataColumn(
                                    label: Text('Total Earn/Loss',
                                        style: zzRegularBlackTextStyle12)),
                              ],
                              rows: [
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  cells: [
                                    DataCell(Text('1',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456781',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                        '8 (\$25) / 11 (\$25) / 14 (\$25) / 22 (\$25)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$100',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('\$0',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('+\$100',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => AppColors.background),
                                  cells: [
                                    DataCell(Text('2',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456782',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                        '7 (\$25) / 11 (\$25) / 14 (\$25) / 22 (\$25)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$100',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('-\$550 (\$25*22)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('-\$450',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  cells: [
                                    DataCell(Text('3',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456783',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('8 (\$25) / 17 (\$25)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$50',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('\$0',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('+\$50',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => AppColors.background),
                                  cells: [
                                    DataCell(Text('4',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456784',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('4 (\$25) / 23 (\$25)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$50',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('\$0',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('+\$50',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  cells: [
                                    DataCell(Text('5',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456785',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                        '7 (\$25) / 9 (\$25) / 11 (\$50) / 14 (\$50) / 22 (\$50)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$200',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('-\$550 (\$25*22)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('-\$350',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => AppColors.background),
                                  cells: [
                                    DataCell(Text('6',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456786',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('12 (\$50)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$50',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('\$0',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('+\$50',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.white),
                                  cells: [
                                    DataCell(Text('7',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('123456787',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('18 (\$50) / 4 (\$100)',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text(
                                      '\$150',
                                      style: zzRegularBlackTextStyle14,
                                    )),
                                    DataCell(Text('\$0',
                                        style: zzRegularBlackTextStyle14)),
                                    DataCell(Text('+\$150',
                                        style: zzRegularBlackTextStyle14)),
                                  ],
                                ),
                                DataRow(
                                  color: MaterialStateColor.resolveWith(
                                      (states) => Colors.black),
                                  cells: [
                                    DataCell(Text('Total',
                                        style: zzRegularBlackTextStyle14
                                            .copyWith(color: Colors.white))),
                                    DataCell(Text('',
                                        style: zzRegularBlackTextStyle14
                                            .copyWith(color: Colors.white))),
                                    DataCell(Text(
                                        '4(\$125) / 7 (\$50) / 8 (\$75) / 11(\$100) / 12(\$50) / 14 (\$100) / 17(\$25))',
                                        style: zzRegularBlackTextStyle14
                                            .copyWith(color: Colors.white))),
                                    DataCell(Text(
                                      '\$700',
                                      style: zzRegularBlackTextStyle14.copyWith(
                                          color: Colors.white),
                                    )),
                                    DataCell(Text('-\$1100',
                                        style: zzRegularBlackTextStyle14
                                            .copyWith(color: Colors.white))),
                                    DataCell(Text('+\$400',
                                        style: zzRegularBlackTextStyle14
                                            .copyWith(color: Colors.white))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // const SizedBox(height: 20),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: GridView.count(
                      crossAxisCount: 5,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 2 / 0.75,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: List.generate(
                        24,
                        (index) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'No. ',
                                  style: zzRegularBlackTextStyle14,
                                ),
                                Text(
                                  (index + 1).toString(),
                                  style: zzRegularBlackTextStyle18.copyWith(
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.textfieldBg,
                                borderRadius: BorderRadius.circular(4.0),
                                border: Border.all(
                                  color: Colors.grey[400] ?? Colors.transparent,
                                  width: 1.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 5.0, horizontal: 10.0),
                                    child: Text(
                                      'Point',
                                      style: zzRegularBlackTextStyle14,
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 1,
                                    decoration:
                                        BoxDecoration(color: Colors.grey[400]),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: TextField(
                                        keyboardType:
                                            TextInputType.numberWithOptions(
                                                decimal: true),
                                        inputFormatters: <TextInputFormatter>[
                                          FilteringTextInputFormatter.allow(
                                              RegExp(r'[0-9]')),
                                        ],
                                        decoration: InputDecoration(
                                          hintText: 'Enter a number',
                                          hintStyle: zzRegularBlackTextStyle14,
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
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
                        backgroundColor: Colors.white,
                        foregroundColor: AppColors.btnColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: AppColors.btnColor),
                        ),
                      ),
                      child: const Text('Cancel'),
                    )),
                const SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {
                        //isStartVisible = false;
                        //Navigator.pop(context);
                        showWinningDialog();
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.btnColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: Text(
                      'Proceed',
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

  void showWinningDialog() {
    final TextEditingController numberController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Enter Winning Number',
                  style: zzRegularBlackTextStyle14.copyWith(
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: numberController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    filled: true,
                    fillColor: AppColors.background,
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
                          color: Colors.grey[400] ??
                              const Color.fromARGB(0, 152, 151, 151),
                          width: 1.0),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
              //const SizedBox(height: 20),
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
                      setState(() {
                        isStartVisible = false;
                      });
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

  Widget _buildTabBar() {
    return TabBar(
      controller: tabController,
      tabs: const [
        Tab(text: 'Adidas'),
        Tab(text: 'Chanel'),
        Tab(text: 'CK'),
        Tab(text: 'Dior'),
        Tab(text: 'Elle'),
        Tab(text: 'Gucci'),
        Tab(text: 'Hermes'),
        Tab(text: 'Levi’s'),
        Tab(text: 'LV'),
        Tab(text: 'Nike'),
        Tab(text: 'Obey'),
        Tab(text: 'Polo'),
        Tab(text: 'Puma'),
        Tab(text: 'Prada'),
        Tab(text: 'Versace'),
      ],
      onTap: (index) {
        // Handle tab selection if needed
      },
      labelStyle: zzRegularBlackTextStyle14,
      unselectedLabelStyle: zzRegularBlackTextStyle14,
      indicatorColor: AppColors.accentColor,
      labelColor: AppColors.accentColor,
      unselectedLabelColor: Colors.black,
      dividerHeight: 1,
    );
  }
}
