import '../../model/completed/completed_list.dart';

abstract class CompletedServices {
  Future<CompletedList> completedList({String dateTime});
}
