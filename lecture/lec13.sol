// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//event 정의

contract lec13 {
    
    event info(string name, uint256 money); //event정의
    
    function sendMoney() public {
        emit info("KimDaeJin", 1000);   //emit으로 event 발생
    }

}