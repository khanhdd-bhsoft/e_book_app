import 'package:e_book/core/enum/search_field.dart';

class StringHelpers {
  static String makeHtml(String string) {
    return """
<!DOCTYPE html>
<html>

<head>
  <title>Title of the document</title>
  <style>
  *{
  margin:0;
  padding:0;
  }
    #wrap {
      padding: 0;
      overflow: hidden;
    }
    #scaled-frame {
      
      zoom: 2;
      -moz-transform: scale(2);
      -moz-transform-origin: 0 0;
      -o-transform: scale(2);
      -o-transform-origin: 0 0;
      -webkit-transform: scale(2);
      -webkit-transform-origin: 0 0;
    }
    #scaled-frame {
      border: 0px;      
    }

    @media screen and (-webkit-min-device-pixel-ratio:0) {
      #scaled-frame {
        zoom: 2;
      }

    }
  </style>
</head>

<body>
  <div id="scaled-frame">
$string
  </div>
</body>

</html>
""";
  }

  static String getReaableCriteriaText(SearchField searchField) {
    switch (searchField) {
      case SearchField.inauthor:
        return "Author";
      case SearchField.inpublisher:
        return "Publisher";
      case SearchField.intitle:
        return "Title";
      case SearchField.subject:
        return "Subject";
      case SearchField.isbn:
        return "ISBN";
      case SearchField.lccn:
        return "LCCN";
      case SearchField.oclc:
        return "OCLC";
    }
  }
}
