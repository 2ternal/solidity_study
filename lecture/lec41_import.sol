// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.6.0 <0.8.0;

//import
//openzeppelin-contracts/contracts/math/SafeMath.sol
// ./ = 같은 폴더
// ../ = 상위 폴더
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/docs-v3.x/contracts/math/SafeMath.sol";
//파일 내의 코드를 완전히 가져옴
contract lec41 {
    using SafeMath for uint256; //library사용하듯이
    uint public a;
    uint public maximum = ~uint256(0); // ==2**256-1; // 2**256 == 2^256
    
    function becomeOverflow(uint _num1, uint _num2) public {
        a = _num1.add(_num2);
    }
}