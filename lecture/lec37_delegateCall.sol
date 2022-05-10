// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

//Delegate call
/*
Call vs Delegate call
Delegate call: 
1. msg.sender가 본래의 스마트컨트랙 사용자를 나타낸다 
2. delegate call이 정의된 스마트 컨트랙(즉caller)이 외부 컨트랙의 함수들들 마치 자신의 것 처럼 사용(실질적인 값도 caller애 저장) 
조건 
외부 스마트컨트랙과 caller 스마트컨트랙은 같은 변수를 갖고 있어야 한다.   
why?
upgradable smart contract 용도 
*/

contract add{
    uint256 public num = 0;
    event Info(address _addr,uint256 _num);
    
    function plusOne() public {
        num = num + 1;
        emit Info(msg.sender,num);
    }
    
}

contract caller{
    uint256 public num = 0;
    //add의 num이 바뀐다
    function callNow(address _contractAddr) public payable{
        (bool success,) = _contractAddr.call(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }
    //caller의 num이 바뀐다
    function delcateCallNow(address _contractAddr) public payable{
        (bool success,) = _contractAddr.delegatecall(abi.encodeWithSignature("plusOne()"));
        require(success,"failed to transfer ether");
    }
}

/*
Alice -> 스마트 컨트랙A.CallB() -> 스마트 컨트랙B.changeB()

delegatecall를 사용하면 스마트 컨트랙의 msg.sender가 Alice로 같다.

스마트 컨트랙B의 로직을 변경해야할 때 데이터들이 스마트 컨트랙A에 저장되어 있기 때문에 스마트 컨트랙B를 과감하게 버리고
새로운 스마트 컨트랙 C를 스마트 컨트랙 A와 연결해서 쓸 수 있다.

*/