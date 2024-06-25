import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../../../core/helpers/StringHelpers.dart';

class BookDescriptionWidget extends StatelessWidget {
  BookDescriptionWidget({super.key, required this.description});
  String description;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Book description",
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            width: MediaQuery.of(context).size.width,
            child: const Divider(
              color: Colors.grey,
              height: 0.8,
            ),
          ),
          // ExpandableDescription(description: description),
          DisplayDescription(data: description)
        ],
      ),
    );
  }
}

class ExpandableDescription extends StatefulWidget {
  ExpandableDescription({super.key, required this.description});
  String description;

  @override
  State<ExpandableDescription> createState() => _ExpandableDescriptionState();
}

class _ExpandableDescriptionState extends State<ExpandableDescription> {
  WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted);
  double webViewHeight = 100.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.loadHtmlString(StringHelpers.makeHtml(widget.description));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () async {
            if (webViewHeight == 100.0) {
              webViewHeight = double.parse(
                (await controller.runJavaScriptReturningResult(
                        "document.getElementById('scaled-frame').clientHeight"))
                    .toString(),
              );
            } else {
              webViewHeight = 100;
            }
            setState(() {});
          },
          child: Container(
            width: MediaQuery.of(context).size.width * 0.96,
            height: webViewHeight,
            child: WebViewWidget(
              controller: controller,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (webViewHeight == 100.0) {
              webViewHeight = double.parse(
                (await controller.runJavaScriptReturningResult(
                        "document.getElementById('scaled-frame').clientHeight"))
                    .toString(),
              );
            } else {
              webViewHeight = 100;
            }
            setState(() {});
          },
          child: Text(
            webViewHeight == 100.0 ? "Show more" : "Show less",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        )
      ],
    );
  }
}

class DisplayDescription extends StatelessWidget {
  DisplayDescription({super.key, required this.data});
  String data;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Html(
        data: data,
      ),
    );
  }
}
