// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//modifier
//반복되는 행동의 코드 작성을 줄여줌

contract lec30{

    //파라미터가 없어서 ()를 써도되고 안써도 됨
    modifier onlyAdults{        
        revert("You are not allowed to pay for the cigarette");
        _;
    } 

    //modifier적용
    function BuyCigarette() public onlyAdults returns(string memory){
        return "Your payment is succeeded";
    }

    //파라미터가 있는 modifier
    modifier onlyAdults2(uint256 _age){
        require(_age>18,"You are not allowed to pay for the cigarette");
        _;
    }
    
    //modifier적용
    function BuyCigarette2(uint256 _age) public onlyAdults2(_age) returns(string memory){
        return "Your payment is succeeded";
    }

    uint256 public num = 5;
    modifier numChange{
        _;
        num = 10;
    }
    //_; 위치에 함수의 코드가 온다
    function numChangeFunction() public numChange{
        num = 15;
    }
}