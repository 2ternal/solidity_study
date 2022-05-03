// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//상속

contract Father{
    string public familyName = "Kim";
    string public givenName = "Jung";
    uint256 public money = 100; 
    
    constructor(string memory _givenName) public {
        givenName = _givenName;
    }
    
    function getFamilyName() view public  returns(string memory){
        return familyName;
    } 
    
    function getGivenName() view public  returns(string memory){
        return givenName;
    } 
    
    function getMoney() view public returns(uint256){
        return money;
    }
    
}

contract Son is Father("James"){    //생성자(constructor)가 있다면 생성자에 맞춰서 상속
    //Father의 모든 기능을 가짐
}