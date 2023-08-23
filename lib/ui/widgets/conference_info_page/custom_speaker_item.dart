import 'package:flutter/material.dart';
import 'package:react_conf/core/util/app_colors.dart';
import 'package:react_conf/core/util/size_config.dart';
import 'package:react_conf/core/util/styles.dart';
import 'package:react_conf/data/model/conference_detail_response/conference_detail_response.dart' as data;
import 'package:react_conf/ui/widgets/conference_info_page/custom_social_button.dart';

class CustomSpeakerItem extends StatelessWidget {
  const CustomSpeakerItem({super.key, required this.imageUrl, required this.name, required this.about, required this.socialData});
  final String imageUrl;
  final String name;
  final String about;
  final data.SocialData socialData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,
      margin: const EdgeInsets.symmetric(
          horizontal: 20.0, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageUrl,
                width: SizeConfig.width! * 0.24,
                height: SizeConfig.width! * 0.24,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,style: h4TextStyle(blackColor),),
                  const SizedBox(height: 8,),
                  Row(
                    children: [
                      if(socialData.twitch != null)
                        Row(
                          children: [
                            CustomSocialButton(icon: "assets/twitter_icon.svg", onTap: (){}),
                            const SizedBox(width: 16,),
                          ],
                        )
                      else
                        const SizedBox(),
                      if(socialData.linkedin != null)
                        Row(
                          children: [
                            CustomSocialButton(icon: "assets/linkedin_icon.svg", onTap: (){}),
                            const SizedBox(width: 16,),
                          ],
                        )
                      else
                        const SizedBox(),
                      if(socialData.dribble != null)
                        Row(
                          children: [
                            CustomSocialButton(icon: "assets/dribbble_icon.svg", onTap: (){}),
                            const SizedBox(width: 16,),
                          ],
                        )
                      else
                        const SizedBox(),
                      if(socialData.github != null)
                        Row(
                          children: [
                            CustomSocialButton(icon: "assets/github_icon.svg", onTap: (){}),
                            const SizedBox(width: 16,),
                          ],
                        )
                      else
                        const SizedBox(),
                    ],
                  ),
                  const SizedBox(height: 8,),
                  Text(about,style: p2TextStyle(blackColor),maxLines: 5,),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
