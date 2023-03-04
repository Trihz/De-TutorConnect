import 'package:flutter/material.dart';

class MyServicesUI extends StatefulWidget {
  const MyServicesUI({super.key});

  @override
  State<MyServicesUI> createState() => _MyServicesUIState();
}

class _MyServicesUIState extends State<MyServicesUI>
    with TickerProviderStateMixin {
  // variable to define the homescreen main color
  Color mainColor = const Color.fromARGB(255, 13, 101, 16);

  /// boolean variable indicate whether the task or pricing floating button has been pressed
  bool isTask = false;

  /// boolean variables used for storing the state of the checkboxes
  bool? check11 = true, check22 = false, check33 = false;

  // text form controller
  final TextEditingController textEditingController = TextEditingController();

  /// function to build the main container
  Widget mainContainer(TabController tabController) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: isTask ? pricingScreen() : tasksScreen(tabController),
    );
  }

  /// function to build the tasks page
  Widget tasksScreen(TabController tabController) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          tabs(tabController),
          tabContents(tabController)
        ],
      ),
    );
  }

  /// function to create the tabs for creating a service
  Widget tabs(TabController tabController) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.98,
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey,
                      offset: Offset(1, 1),
                      blurRadius: 1,
                      spreadRadius: 1)
                ],
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(2))),
            child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: mainColor,
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                  color: mainColor,
                ),
                tabs: const [
                  Tab(
                    child: Text(
                      "Title",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Description",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Availability",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Extra Info",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                    ),
                  )
                ]),
          ),
        ],
      ),
    );
  }

  /// function to display the tab contents
  Widget tabContents(TabController tabController) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: TabBarView(
        controller: tabController,
        children: [
          title(),
          description(),
          availability(),
          extrainfo(),
        ],
      ),
    );
  }

  /// function to display the title section
  Widget title() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Center(
                  child: Text(
                "Title Of The Service",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Center(
                  child: Text(
                      "Provide a  clear and concise title that accurately represents the services that you offer")),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const TextField(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Title",
                  hintStyle: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.w300,
                      fontSize: 12),
                  labelStyle: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w800),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  /// function to display the description sectin
  Widget description() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.4,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Center(
                  child: Text(
                "Description Of The Service",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
              )),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 0.7,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Center(
                  child: Text(
                      "Provide a detailed description of the services that you are offering, including the subject area, the level of expertise, and any additional details that students should know.")),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: TextFormField(
                  controller: textEditingController,
                  minLines: 3,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                      hintText: "Task definition",
                      hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w300),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5)))),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Center(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: mainColor,
                          foregroundColor: Colors.white),
                      child: const Text(
                        "SAVE",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.w800),
                      ))),
            ),
          ],
        ),
      ),
    );
  }

  /// function to display the availability of the seller
  Widget availability() {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(color: Colors.transparent),
    ));
  }

  /// function to displa the extra information
  Widget extrainfo() {
    return Center(
        child: Container(
      height: MediaQuery.of(context).size.height * 0.3,
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: const BoxDecoration(color: Colors.transparent),
    ));
  }

  /// function to display the pricing screen
  Widget pricingScreen() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            paymentStyle(),
            paymentDetails(),
            modeOfPayment(),
            priceSection()
          ],
        ));
  }

  /// function to build the payment details setcion
  Widget paymentDetails() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Payment Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Image.asset("assets/mpesa.png")),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "0792001961",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13),
                        ),
                        Icon(
                          Icons.edit,
                          size: 15,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                width: MediaQuery.of(context).size.width * 0.4,
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 1,
                        spreadRadius: 1)
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration:
                            const BoxDecoration(color: Colors.transparent),
                        child: Image.asset("assets/paypal.png")),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "57829492729",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 13),
                        ),
                        Icon(
                          Icons.edit,
                          size: 15,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  /// function to display the mode of payment
  Widget modeOfPayment() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 1,
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Mode of Payment",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  children: [
                    Checkbox(
                        value: check11,
                        checkColor: Colors.white,
                        activeColor: mainColor,
                        onChanged: (bool? value) {
                          setState(() {
                            check11 = value;
                          });
                        }),
                    const Text(
                      "MPesa",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 0.3,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Row(
                  children: [
                    Checkbox(
                        value: check22,
                        checkColor: Colors.white,
                        activeColor: mainColor,
                        onChanged: (bool? value) {
                          setState(() {
                            check22 = value;
                          });
                        }),
                    const Text(
                      "PayPal",
                      style: TextStyle(color: Colors.black45),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// function to display the price setcion
  Widget priceSection() {
    return Container(
        height: MediaQuery.of(context).size.height * 0.18,
        width: MediaQuery.of(context).size.width * 1,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            Container(
                height: MediaQuery.of(context).size.height * 0.04,
                width: MediaQuery.of(context).size.width * 1,
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Price (Depends on delivery time)",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                )),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(top: 5, left: 10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "1 day",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "KES",
                        hintStyle: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "2 - 5 days",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "KES",
                        hintStyle: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: MediaQuery.of(context).size.width * 0.2,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "1 Week",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                            fontSize: 14),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width * 0.15,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: const TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        hintText: "KES",
                        hintStyle: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w300,
                            fontSize: 12),
                        labelStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  /// function to display how you want to be paid section
  Widget paymentStyle() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.225,
      width: MediaQuery.of(context).size.width * 1,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "How do you want to be paid",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.43,
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: check11,
                              checkColor: Colors.white,
                              activeColor: mainColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  check11 = value;
                                });
                              }),
                          const Text(
                            "Milestone",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                        "Each milestone represents a portion of the work to be completed, and is paid out upon the completion and approval of that portion of the work by the student.",
                        style: TextStyle(fontWeight: FontWeight.w300))
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width * 0.43,
                padding: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: MediaQuery.of(context).size.width * 0.43,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                              value: check11,
                              checkColor: Colors.white,
                              activeColor: mainColor,
                              onChanged: (bool? value) {
                                setState(() {
                                  check11 = value;
                                });
                              }),
                          const Text(
                            "Full payment",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                        "The student pays the full fee for the gig before any work has been completed.",
                        style: TextStyle(fontWeight: FontWeight.w300))
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// function to build the float buttons
  Widget floatButtons() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.5,
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTask = false;
              });
            },
            child: CircleAvatar(
              backgroundColor: mainColor,
              radius: 28,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 27,
                child: Text(
                  "Service",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isTask = true;
              });
            },
            child: CircleAvatar(
              backgroundColor: mainColor,
              radius: 28,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 27,
                child: Text(
                  "Pricing",
                  style: TextStyle(
                      color: mainColor,
                      fontSize: 13,
                      fontWeight: FontWeight.w300),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController tabController =
        TabController(length: 4, vsync: this, initialIndex: 0);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [mainContainer(tabController), floatButtons()],
        ),
      ),
    );
  }
}
