import 'package:daytona_ssignment/app/app_page.dart';
import 'package:daytona_ssignment/feature/home_page/home_controller.dart';
import 'package:daytona_ssignment/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const Icon(Icons.menu, color: Colors.black),
          backgroundColor: Colors.grey[100],
          elevation: 0),
      backgroundColor: Colors.grey[100],
      body: Column(children: [
        TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8)),
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(8))))
            .marginAll(20),
        Expanded(
          child: Center(
            child: GetBuilder<HomeController>(builder: (_) {
              if (_.isLoading) {
                return const CircularProgressIndicator();
              }
              if (_.isError) {
                return TextButton(
                    onPressed: () => _.fetchData(), child: const Text("Retry"));
              }
              if (_.isLoaded) {
                if (_.countries.isEmpty) {
                  return Text(
                    "No Countries found",
                    style: Get.textTheme.bodyLarge
                        ?.copyWith(fontWeight: FontWeight.normal),
                  );
                }
                String currentAlphabet = "";
                String previousAlphabet = "";
                return ListView.builder(
                  addAutomaticKeepAlives: true,
                  itemCount: _.countries.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      previousAlphabet = "1";
                    }
                    currentAlphabet = _.countries[index][0];
                    if (index != 0 && previousAlphabet != currentAlphabet) {
                      previousAlphabet = _.countries[index - 1][0];
                    }
                    String key = _.flagKeys.keys.firstWhere(
                        (k) => _.flagKeys[k] == _.countries[index],
                        orElse: () => "");
                    String imageUrl = "https://flagcdn.com/h40/$key.png";
                    return Column(
                      children: [
                        if (currentAlphabet != previousAlphabet)
                          Container(
                              padding:
                                  const EdgeInsets.fromLTRB(40, 15, 15, 15),
                              alignment: Alignment.centerLeft,
                              child: Text(currentAlphabet,
                                  style: Get.textTheme.bodyLarge)),
                        InkWell(
                          onTap: () => Get.toNamed(
                            RouteName.countryDetails,
                            parameters: {
                              "country": _.countries[index],
                              "imageUrl": imageUrl
                            },
                          ),
                          child: Container(
                            color: Colors.white,
                            child: Column(children: [
                              Row(
                                children: [
                                  const SizedBox(width: 30),
                                  CustomNetworkImage(
                                    imageUrl,
                                    height: 15,
                                    width: 20,
                                  ),
                                  const SizedBox(width: 15),
                                  Text(
                                    _.countries[index],
                                    style: Get.textTheme.bodyLarge?.copyWith(
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ).paddingAll(10),
                              const Divider(height: 1)
                            ]),
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
              return Container();
            }),
          ),
        )
      ]),
    );
  }
}
