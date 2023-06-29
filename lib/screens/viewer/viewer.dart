import 'package:agneya/screens/viewer/pdf_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewerPage extends StatelessWidget {
  final String url;
  final String courseName;
  final String year;
  const ViewerPage({super.key, required this.url, required this.courseName, required this.year});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("$year - $courseName",overflow: TextOverflow.ellipsis,),
        centerTitle: true,
        titleTextStyle: GoogleFonts.nunitoSans(),
      ),
      body: SafeArea(
          child:FutureBuilder(
            future: PdfApi.loadPdfFromNetwork(url),
            builder: (context,snapshot){
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                  return const Center(child: CircularProgressIndicator());
                default:
                  if(snapshot.hasError){
                    return const Center(child: Text("Some error has occurred"),);
                  }else{
                    final file = snapshot.data;
                    print('file fetched');
                    return PDFView(
                      filePath: file?.path,

                    );
                  }
              }
            },
          ),
      ),
    );
  }
}
