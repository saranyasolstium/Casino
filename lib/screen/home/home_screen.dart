import 'package:flutter/material.dart';
import 'package:casino_web_app/res/colors/app_color.dart';
import 'package:casino_web_app/res/font_style/style.dart';
import 'package:casino_web_app/widget/dropdown.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  List<TextEditingController> controllers = [];
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 15, vsync: this);
    focusNode.addListener(() {
      setState(() {
        // Rebuild the widget when focus changes
      });
    });

    void dispose() {
      // Clean up the focus node when the widget is disposed
      focusNode.dispose();
      super.dispose();
    }
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
                            Row(children: [
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
                                print('Selected room: $value');
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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: controllers.map((controller) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 10),
                                    Text(
                                      'Ticket serial Number',
                                      style: zzRegularBlackTextStyle14,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      child: TextField(
                                        controller: controller,
                                        focusNode: focusNode,
                                        decoration: InputDecoration(
                                          hintText:
                                              'Enter ticket serial number',
                                          hintStyle: zzRegularBlackTextStyle14
                                              .copyWith(color: Colors.grey),
                                          filled: true,
                                          fillColor: focusNode.hasFocus
                                              ? AppColors.enableInput
                                              : AppColors.background,
                                          border: const OutlineInputBorder(),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.grey[400] ??
                                                  Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: AppColors.accentColor,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
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
                                      showWinningDialog();
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
                ],
              ),
            ),
          ],
        ),
      ),
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
