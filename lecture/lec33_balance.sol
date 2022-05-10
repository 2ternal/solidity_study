// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

/*
주소.balance
주소.balance는 해당 특정 주소의 현재 갖고있는 이더의 잔액(msg.value는 송금액) 
주소.balance 와 같은 형태로 사용한다.

msg.sender 
msg.sender는 스마트컨트랙을 사용하는 하는 주체(사용자)  
msg.sender는 앞으로 설명해야 할 call vs delegate call에서 주요 내용이라서 중요
*/

contract MobileBanking{
 
    event SendInfo(address _msgSender, uint256 _currentValue);
    event MyCurrentValue(address _msgSender, uint256 _value);
    event CurrentValueOfSomeone(address _msgSender, address _to,uint256 _value);
    //msg.sender가 _to에게 msg.value만큼 송금
    function sendEther(address payable _to) public payable {
        require(msg.sender.balance>=msg.value, "Your balance is not enough");
        _to.transfer(msg.value);    
        emit SendInfo(msg.sender,(msg.sender).balance);
    }
    //사용자의 주소, 사용자의 잔액 확인
    function checkValueNow() public{
        emit MyCurrentValue(msg.sender, msg.sender.balance);
    }
    //사용자가 _to의 잔액을 확인
    function checkUserMoney(address _to) public{
        emit CurrentValueOfSomeone(msg.sender,_to ,_to.balance);
    }
    
}
