// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

// payable을 생성자에 넣을때
// 특정 주소에게만 권한 주기

contract MobileBanking{
    
    address owner;
    constructor() payable{  //배포되면서 생성자가 실행
        owner = msg.sender; //배포한 사용자 주소
    }
    //owner만 함수 사용 가능하도록 하는 modifier
    modifier onlyOwner{
        require(msg.sender == owner, "Only Owner!");
        _;
    }
    
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to,uint256 _value);
    //owner만 함수 사용 가능
    function sendEther(address payable _to) public onlyOwner payable {  
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);    
        emit SendInfo(msg.sender,(msg.sender).balance);
    }
    //owner만 함수 사용 가능
    function checkValueNow() public onlyOwner {
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }
    //owner만 함수 사용 가능
    function checkUserMoney(address _to) public onlyOwner {
        emit CurrentValueOfSomeone(msg.sender,_to ,_to.balance);
    }
    
}