import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/router/router_const.dart';
import '../../home/model/article_mode.dart';

class DetailsScreen extends StatelessWidget {
  final Article? article;

  const DetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(article?.title ?? '')),
        leading: IconButton(
            onPressed: () {
              context.go(RouterConst.home);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
                article?.urlToImage ?? 'https://picsum.photos/250?image=9'),
            Text(
              article?.author ?? '',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black54),
            ),
            Text(
              article?.title ?? '',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Card(
              child: Row(
                children: [
                  Expanded(child: Text(article?.description ?? '')),
                  TextButton(
                      onPressed: () {
                        launchUrl(article?.url as Uri,
                            mode: LaunchMode.externalApplication);
                      },
                      child: const Text("view full article")),
                ],
              ),
            ),
            Text("Published at ${article?.publishedAt}")
          ],
        ),
      ),
    );
  }
}
