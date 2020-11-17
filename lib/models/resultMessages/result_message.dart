class ResultMessage{

  bool isSuccess;

  void setIsSuccess(bool current){
    this.isSuccess = current;
  }

  bool getIsSuccess(){
    return this.isSuccess;
  }

  ResultMessage();

  ResultMessage.fromObject(dynamic o) {
    this.isSuccess = o["isSuccess"];
  }

}