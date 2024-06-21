import 'dart:async';

import 'package:e_book/core/customs/custom_back_icon.dart';
import 'package:e_book/core/customs/custom_text_style.dart';
import 'package:e_book/core/platform/file_io.dart';
import 'package:e_book/core/utils/common_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';

class PDFViewPage extends StatefulWidget {
  PDFViewPage({super.key, required this.title, required this.url});
  String title;
  String url;

  @override
  State<PDFViewPage> createState() => _PDFViewPageState();
}

class _PDFViewPageState extends State<PDFViewPage> {
  String? urlPDFPath;
  bool isLoading = true;
  String urlContent = "";
  String testData = '''
<?xml version="1.0" encoding="UTF-8" standalone="no"?>
<fulfillmentToken fulfillmentType="buy" xmlns="http://ns.adobe.com/adept">
    <distributor>urn:uuid:00000000-0000-0000-0000-000000000001</distributor>
    <operatorURL>http://books.google.com/books/acs4/fulfillment</operatorURL>
    <expiration>2024-06-19T19:42:07-07:00</expiration>
    <transaction>ge:ae0fbec5-c3f4-892c-e509-10df2371d639:1718850427092732</transaction>
    <resourceItemInfo>
        <resource>urn:uuid:ae0fbec5-c3f4-892c-e509-10df2371d639</resource>
        <resourceItem>1</resourceItem>
        <src>https://books.google.com.vn/books/download/Machines_Who_Think.pdf?acsid=urn:uuid:ae0fbec5-c3f4-892c-e509-10df2371d639&amp;output=acs4_book_bytes&amp;dl_type=sample&amp;ar=f090f2c8f1dc2e9f2f43ea35002a773e</src>
        <downloadType>simple</downloadType>
    </resourceItemInfo>
    <hmac>9j4U26aDwuD204jjn9LzWgkcEdo=</hmac>
</fulfillmentToken>
''';

  int? pages = 0;
  int currentPage = 0;
  var data;

  final Completer<PDFViewController> _controller =
      Completer<PDFViewController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readData();
  }

  Future<void> readData() async {
    // urlPDFPath = await CommonMethods().parseAcsm(testData);
    // data = await CommonMethods().parseAcsmAndDownloadFile(testData);
    // await FileIO().downloadAcsmFile(urlPDFPath!, widget.title);
    // data = await FileIO().readFile(widget.title);
    if (mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: CustomTextStyles.header2TextStyle(),
        ),
        centerTitle: true,
        leading: CustomBackButton(),
        elevation: 5,
      ),
      body: isLoading || data == null
          ? Container(
              height: MediaQuery.of(context).size.height * 0.8,
            )
          : PDFView(
              pdfData: data,
              // filePath: urlPDFPath,
              enableSwipe: true,
              swipeHorizontal: true,
              autoSpacing: false,
              pageFling: true,
              pageSnap: true,
              defaultPage: currentPage,
              fitPolicy: FitPolicy.BOTH,
              preventLinkNavigation: false,
              onPageChanged: (page, total) {
                setState(() {
                  currentPage = page!;
                });
              },
            ),
      // : const PDF(
      //     enableSwipe: true,
      //     swipeHorizontal: true,
      //     autoSpacing: false,
      //     pageFling: false,
      //   ).cachedFromUrl(
      //     "https://books.google.com.vn/books/download/Machines_Who_Think.pdf"),
      floatingActionButton: isLoading
          ? Container()
          : FutureBuilder<PDFViewController>(
              future: _controller.future,
              builder: (context, AsyncSnapshot<PDFViewController> snapshot) {
                if (snapshot.hasData) {
                  return FloatingActionButton.extended(
                    label: Text("Go to ${pages! ~/ 2}"),
                    onPressed: () async {
                      await snapshot.data!.setPage(pages! ~/ 2);
                    },
                  );
                }

                return Container();
              },
            ),
    );
  }
}
