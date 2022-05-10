// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//주의해야할 점
//변수 값을 reference하는게 아니여서 변수의 값이 바뀐다면 update가 필요

contract lec19{

   uint256 num = 89;
   mapping(uint256 => uint256) numMap;
   uint256[] numArray;
   
   function changeNum(uint256 _num) public{
       num = _num;
   }
   function showNum() public view returns(uint256){
      return num;
   }
   
   function numMapAdd() public{
       numMap[0] = num;
   }

   function showNumMap() public view returns(uint256){
       return numMap[0];
   }

   function UpdateMap() public{
       numMap[0] = num;
   }
   
   function numArrayAdd() public{
       numArray.push(num);
   }

   function showNumArray() public view returns(uint256){
       return numArray[0];
   }

   function updateArray() public {
       numArray[0] = num;
   }
   
}