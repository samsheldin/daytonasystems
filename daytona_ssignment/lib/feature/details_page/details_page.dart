import 'package:daytona_ssignment/feature/details_page/details_controller.dart';
import 'package:daytona_ssignment/widgets/image_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: GetBuilder<DetailsController>(builder: (_) {
          if (_.isLoading) {
            return const CircularProgressIndicator();
          }
          if (_.isError) {
            return TextButton(
                onPressed: () => _.fetchData(), child: const Text("Retry"));
          }
          if (_.isLoaded) {
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 0, left: 30, right: 30),
                  width: double.infinity,
                  height: 300,
                  color: Colors.red,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${Jiffy(_.data?.response?[0].time).MMMMEEEEd} ${DateTime.parse(_.data?.response?[0].time ?? "2000-01-01").timeZoneName}",
                            style: Get.textTheme.bodyMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                          ),
                          const SizedBox(height: 10),
                          Text("Total case in ${Get.parameters["country"]}",
                              style: Get.textTheme.headline6?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400)),
                          const SizedBox(height: 10),
                          Text(
                              _.data?.response?[0].cases?.total?.toString() ??
                                  "",
                              style: Get.textTheme.headline4?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600))
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: CustomNetworkImage(
                          Get.parameters["imageUrl"],
                          height: 30,
                          width: 45,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InfoCard(
                            "Deaths",
                            _.data?.response?[0].deaths?.total?.toString(),
                            Colors.red),
                        InfoCard(
                            "Recovered",
                            _.data?.response?[0].cases?.recovered?.toString(),
                            Colors.green),
                      ],
                    ).marginSymmetric(horizontal: 15),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      margin: const EdgeInsets.all(20),
                      child: CardInfoText("ACTIVE CASES",
                          _.data?.response?[0].cases?.active?.toString()),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6)),
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        children: [
                          CardInfoText("SERIOUS/CRITICAL",
                              _.data?.response?[0].cases?.critical?.toString()),
                          CardInfoText(
                              "NEW CASES",
                              (_.data?.response?[0].cases?.ne?.toString() ??
                                  "0")),
                        ],
                      ),
                    ),
                  ],
                ))
              ],
            );
          }
          return Container();
        }),
      ),
    );
  }
}

class CardInfoText extends StatelessWidget {
  final String title;
  final String? data;
  const CardInfoText(
    this.title,
    this.data, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: Get.textTheme.bodyMedium
            ?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 10),
      Text(data ?? "",
          style:
              Get.textTheme.headline5?.copyWith(fontWeight: FontWeight.bold)),
    ]).paddingSymmetric(horizontal: 20, vertical: 30);
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String? data;
  final Color? color;
  const InfoCard(
    this.title,
    this.data,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            title,
            style: Get.textTheme.bodyMedium
                ?.copyWith(color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          Text(
            data ?? "",
            style: Get.textTheme.headline5
                ?.copyWith(color: color, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
        ]).paddingSymmetric(horizontal: 20, vertical: 30),
      ),
    );
  }
}
