import 'package:flutter/material.dart';

class Services extends StatefulWidget {
  const Services({super.key});

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  // variable to define the  main colors
  Color mainColor = const Color.fromARGB(255, 13, 101, 16);
  Color mainColor2 = const Color.fromARGB(255, 4, 38, 65);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: MediaQuery.of(context).size.width * 1,
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 1,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: const EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [mainColor, mainColor2],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight),
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 0.25,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Column(
                      children: [
                        const SizedBox(height: 12),
                        const Text(
                          "Status",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "Online",
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Delivery Rate",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w100),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "7.5",
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            SizedBox(width: 10),
                            Icon(Icons.bookmark),
                            SizedBox(width: 3),
                            Text(
                              "Badges",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),
                        Text(
                          "2",
                          style: TextStyle(
                              color: mainColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: MediaQuery.of(context).size.width * 1,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              padding: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  const Text(
                    "Star Rating",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w100),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: mainColor,
                        size: 17,
                      ),
                      Icon(
                        Icons.star,
                        color: mainColor,
                        size: 17,
                      ),
                      Icon(
                        Icons.star,
                        color: mainColor,
                        size: 17,
                      ),
                      Icon(
                        Icons.star,
                        color: mainColor,
                        size: 17,
                      ),
                      const Icon(
                        Icons.star,
                        color: Color.fromARGB(255, 159, 215, 145),
                        size: 17,
                      )
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 10,
              indent: 20,
              height: 1,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 20, top: 6),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                children: [
                  const Text(
                    "Pricing:",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(width: 40),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.7,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: const Text(
                                "1 day:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: const Text(
                                "Ksh 360",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: const Text(
                                "3 - 5 days:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: const Text(
                                "Ksh 120",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: const Text(
                                "1 Week:",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.03,
                              width: MediaQuery.of(context).size.width * 0.15,
                              decoration: const BoxDecoration(
                                  color: Colors.transparent),
                              child: const Text(
                                "Ksh 150",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 10,
              indent: 20,
              height: 1,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Tutoring Category",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  Row(
                    children: [
                      Icon(Icons.engineering, color: mainColor),
                      const SizedBox(width: 10),
                      const Text("Engineering"),
                    ],
                  )
                ],
              ),
            ),
            const Divider(
              color: Colors.grey,
              endIndent: 10,
              indent: 20,
              height: 1,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 1,
              padding: const EdgeInsets.only(left: 20),
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Skills",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200),
                  ),
                  Text("1. Trigonometric equations"),
                  Text("2. Differentiation"),
                  Text("3. Integration"),
                  Text("4. Numerical methods")
                ],
              ),
            ),
            const SizedBox(height: 40),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: const BoxDecoration(color: Colors.transparent),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: const BoxDecoration(color: Colors.transparent),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                            foregroundColor: Colors.white,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)))),
                        child: const Text("Apply for Service")),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:
                          const BoxDecoration(color: Colors.transparent),
                      child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: mainColor,
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)))),
                          child: const Text("Contact Tutor")))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
