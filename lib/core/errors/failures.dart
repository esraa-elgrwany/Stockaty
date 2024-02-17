
abstract class Failures{
  String errormsg;
  Failures( this.errormsg);

  @override
  toString(){
    return errormsg;
  }
}
class ServerFailure extends Failures {
  ServerFailure(super.errormsg);
}

class LocalFailures extends Failures{
  LocalFailures( super.errormsg);

}