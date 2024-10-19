import 'package:intl/intl.dart';

String indianRupee(amount) =>
    "₹${NumberFormat('#,##,###').format(int.parse(amount))}";
