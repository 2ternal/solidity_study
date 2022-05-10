// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//두개 이상의 상속

contract Father{

    uint256 public fatherMoney = 100;

    function getFatherName() public pure returns(string memory){
        return "KimJung";
    }
    
    function getMoney() public view virtual returns(uint256){   //overriding될 함수
        return fatherMoney;
    }
    
}

contract Mother{

    uint256 public motherMoney = 500;

    function getMotherName() public  pure returns(string memory){
        return "Leesol";
    }

    function getMoney() public view virtual returns(uint256){   //overriding될 함수
        return motherMoney;
    }

}


contract Son is Father, Mother {

    function getMoney() public view override(Father,Mother) returns(uint256){
        return fatherMoney+motherMoney;
    }

}