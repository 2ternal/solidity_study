// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

// function return값 변수 명시

contract lec29{
    
    function add(uint256 _num1, uint256 _num2) public pure returns (uint256){
        uint256 total = _num1 + _num2;
        return total;
    }
    
    function add2(uint256 _num1, uint256 _num2) public pure returns (uint256 total){
        //total이 미리 정의 됨
        //return할 값이 많을 때 유용함
        total = _num1 + _num2;
        return total;
    }
    
}