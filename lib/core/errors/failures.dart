
abstract class Failures{
  String? errormsg;
  Failures({required this.errormsg});

}
class ServerFailure extends Failures {
  ServerFailure({required super.errormsg});
}

class LocalFailures extends Failures{
  LocalFailures({required super.errormsg});

}