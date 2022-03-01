import 'package:intl/intl.dart';

String convertNum2Amount(int x) {
  NumberFormat formatter = NumberFormat("000000000000");
  String l1, l2, l3, l4, l5, l6 = " ";
  String newNum = formatter.format(x);
  //Last digit newNum[newNum.length - 1] -->ahad

  // print(newNum[newNum.length - 1]);
  int c1 = int.parse(newNum[newNum.length - 1]);

  switch (c1) {
    case 1:
      l1 = "واحد";
      break;
    case 2:
      l1 = "اثنان";
      break;
    case 3:
      l1 = "ثلاثة";
      break;
    case 4:
      l1 = "اربعة";
      break;
    case 5:
      l1 = "خمسة";
      break;
    case 6:
      l1 = "ستة";
      break;
    case 7:
      l1 = "سبعة";
      break;
    case 8:
      l1 = "ثمانية";
      break;
    case 9:
      l1 = "تسعة";
      break;
    default:
      l1 = " ";
  }
  int c2 = int.parse(newNum[newNum.length - 2]);
  switch (c2) {
    case 1:
      l2 = "عشر";
      break;
    case 2:
      l2 = "عشرون";
      break;
    case 3:
      l2 = "ثلاثون";
      break;
    case 4:
      l2 = "اربعون";
      break;
    case 5:
      l2 = "خمسون";
      break;
    case 6:
      l2 = "ستون";
      break;
    case 7:
      l2 = "سبعون";
      break;
    case 8:
      l2 = "ثمانون";
      break;
    case 9:
      l2 = "تسعون";
      break;
    default:
      l2 = " ";
  }
  if (l1 != " " && c2 > 1) {
    l2 = l1 + " و" + l2;
  }
  if (l2 == " ") {
    l2 = l1;
  }
  if (c1 == 0 && c2 == 1) {
    l2 = l2 + "ة";
  }
  if (c1 == 1 && c2 == 1) {
    l2 = "احدى عشر";
  }
  if (c1 == 2 && c2 == 1) {
    l2 = "اثنى عشر";
  }
  if (c1 > 2 && c2 == 1) {
    l2 = l1 + l2;
  }
  // print(l2);
  int c3 = int.parse(newNum[newNum.length - 3]);
  // print("this is  ${c3.toString()}");
  if (c3 > 2) {
    String tmpstr = convertNum2Amount(c3);
    // print(tmpstr.substring(0, tmpstr.length - 1));
    l3 = tmpstr.substring(0, tmpstr.length - 1) + "مائة";
  } else {
    switch (c3) {
      case 1:
        l3 = "مائة";
        break;
      case 2:
        l3 = "مئتان";
        break;
      default:
        l3 = " ";
    }
  }
  if (l3 != " " && l2 != " ") l3 = l3 + " و" + l2;
  if (l3 == " ") l3 = l2;

  int c4 = int.parse(newNum.substring(6, newNum.length - 3));
  l4 = " ";
  if (c4 == 1) {
    l4 = "الف";
    print('heeeeeeeeeeeeee');
  }
  if (c4 == 2) {
    l4 = "الفان";
  }
  if (c4 >= 3 && c4 <= 10) {
    l4 = convertNum2Amount(c4) + " الاف";
  }
  //else
  if (c4 > 10) {
    l4 = convertNum2Amount(c4).substring(0, convertNum2Amount(c4).length) +
        " الف";
  }

  if (l4 != " " && l3 != " ") l4 = l4 + " و" + l3;
  if (l4 == " ") l4 = l3;

  int c5 = int.parse(newNum.substring(3, newNum.length - 6));
  l5 = " ";
  if (c5 == 1) {
    l5 = "مليون";
    print('heeeeeeeeeeeeee');
  }
  if (c5 == 2) {
    l5 = "مليونان";
  }
  if (c5 >= 3 && c5 <= 10) {
    l5 = convertNum2Amount(c5) + " ملايين";
  }
  //else
  if (c5 > 10) {
    l5 = convertNum2Amount(c5).substring(0, convertNum2Amount(c5).length) +
        " مليون";
  }

  if (l5 != " " && l4 != " ") l5 = l5 + " و" + l4;
  if (l5 == " ") l5 = l4;

  int c6 = int.parse(newNum.substring(0, 3));
  l6 = " ";
  if (c6 == 1) {
    l6 = "مليار";
    print('heeeeeeeeeeeeee');
  }
  if (c6 == 2) {
    l6 = "ملياران";
  }

  //else
  if (c6 > 2) {
    l6 = convertNum2Amount(c6).substring(0, convertNum2Amount(c6).length) +
        " مليار";
  }

  if (l6 != " " && l5 != " ") l6 = l6 + " و" + l5;
  if (l6 == " ") l6 = l5;
  return l6;
}
