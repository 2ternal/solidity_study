// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

//interface

/*
interface : 스마트컨트랙 내에서 정의되어야할 필요한 것 
1, 함수는 external로 표시
2, enum, structs 가능 
3, 변수, 생성자 불가(constructor X)
*/

interface ItemInfo {
    struct item{
        string name;
        uint256 price;
    }
    //함수는 external로 표시
    function addItemInfo(string memory _name,uint256 _price) external;
    function getItemInfo(uint256 _index) external view returns(item memory);
}
//interface를 적용한다면 interface내에 정의된 함수를 무조건 정의해줘야함
contract lec39 is ItemInfo{
    item[] public itemList;
    //item추가
    function addItemInfo(string memory _name,uint256 _price) override public {
        itemList.push(item(_name,_price));
    }
    //itemList에서 indexing
    function getItemInfo(uint256 _index) override public view returns(item memory) {
        return itemList[_index];
    }
} 