import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:teqmavens_task/helper/app_color.dart';
import 'package:teqmavens_task/helper/constants.dart';
import 'package:teqmavens_task/helper/padding_config.dart';
import 'package:teqmavens_task/helper/string_constants.dart';
import 'package:teqmavens_task/helper/theme_service.dart';
import 'package:teqmavens_task/utils/widgets/common_text_feild.dart';
import 'package:teqmavens_task/utils/widgets/text_widget.dart';
import 'home_controller.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final ThemeService _themeService = ThemeService();

  @override
  Widget build(BuildContext context) {
    final defaultColorScheme = Theme.of(context).colorScheme;

    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration:   BoxDecoration(
          color: defaultColorScheme.primaryContainer,
        ),
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
          child: Column(
            children: [
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child:CustomTextField(
                      controller: controller.searchController,
                      cursorColor: AppColors.blackColor,
                      readOnly: true,
                      onTap: () {
                        controller.onChangeAddress(context);
                      },
                      hintText: StringConstants.searchLocation,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        color: AppColors.grey,
                      ),
                      contentPadding: const EdgeInsets.only(left: 14, right: 14, top: 14),
                      prefixIcon: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                        ],
                      ),
                    ),
                  ),
                  Obx(() {
                    return  Switch(
                      value: _themeService.theme == ThemeMode.dark,
                      onChanged: (value) {
                        _themeService.switchTheme();
                      },
                    );
                  }),
                ],
              ),
              const Gap(30),
              Obx(() => controller.weatherData.value!=null?
              Column(
                children: <Widget>[
                  TextWidget(controller.weatherData.value!.name.toString(),),
                  Gap(12),
                  TextWidget(controller.weatherData.value!.main.toString(),fontSize:24 ,fontWeight: FontWeight.bold,),
                  Gap(12),
                  TextWidget('${StringConstants.min}${controller.weatherData.value!.minTemp.toString()}°F',),
                  TextWidget('${StringConstants.max}${controller.weatherData.value!.maxTemp.toString()}°F',),
                  TextWidget('${StringConstants.humidity} ${controller.weatherData.value!.humidity.toString()}',),
                  TextWidget('${StringConstants.windSpeed} ${controller.weatherData.value!.windSpeed.toString()}',),
                  Image.network('${ImageBaseUrl+controller.weatherData.value!.icon!}.png'),
                  TextWidget(DateFormat.yMMMd().format(controller.weatherData.value!.date!),),
                  TextWidget( DateFormat.Hm().format(controller.weatherData.value!.date!),),
                ],
              ):Container()
              ),
        Spacer(),
        Obx(() => controller.forecastData.value!=null?
        Flexible(
          child: ListView.builder(
            shrinkWrap: true,
              itemCount:controller.forecastData.value!.list.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return   Container(
                    margin: const EdgeInsets.only(right: 12),
                    padding: getPdFrAll(12),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.whiteColorG,
                    ),
                    child: Column(
                      children: [
                        TextWidget(controller.forecastData.value!.list[index].name.toString(),),
                        TextWidget(controller.forecastData.value!.list[index].main.toString(), fontSize: 18.0),
                        TextWidget('${StringConstants.min}${controller.forecastData.value!.list[index].minTemp.toString()}°F',fontSize: 12,),
                        TextWidget('${StringConstants.max}${controller.forecastData.value!.list[index].maxTemp.toString()}°F',fontSize: 12,),
                        TextWidget('${StringConstants.humidity} ${controller.forecastData.value!.list[index].humidity.toString()}',),
                        TextWidget('${StringConstants.windSpeed} ${controller.forecastData.value!.list[index].windSpeed.toString()}',color:AppColors.grey),
                        Image.network('${ImageBaseUrl+controller.forecastData.value!.list[index].icon!}.png'),
                        TextWidget(DateFormat.yMMMd().format(controller.forecastData.value!.list[index].date!),fontSize: 12,),
                      ],
                    ));
          
              }
          ),
        ):Container())
            ],
          ),
        ),
      ),
    );
  }

}
