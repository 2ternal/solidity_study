// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//event index

contract lec14  {

    event numberTracker(uint256 num, string str);
    event numberTracker2(uint256 indexed num, string str);  //num을 통해 특정 event 추적(index)가능

    uint256 num = 0;

    function PushEvent(string memory _str) public {
        emit numberTracker(num,_str);
        emit numberTracker2(num,_str);
        num ++;
    }

}