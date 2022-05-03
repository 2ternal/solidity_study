// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//key-value mapping
//length기능이 없음
//key로 mapping되는 value가 없으면 null(0)이 return됨

contract lec17{

    mapping(string=>uint256) private priceList; //key = string, value = uint256
    mapping(uint256=>string) private nameList;  //key = uint256, value = string
    mapping(uint256=>uint256) private ageList;  //key = uint256, value = uint256
    
    function setAgeList(uint256 _key,uint256 _age) public {
        ageList[_key] = _age;
    }
    
    function getAge(uint256 _key) public view returns(uint256){
        return ageList[_key];
    }
    
    function setNameList(uint256 _key,string memory _name) public {
        nameList[_key] = _name;
    }
    
    function getName(uint256 _key) public view returns(string memory){
        return nameList[_key];
    }
    
    function setPriceList(string memory _itemName,uint256 _price) public {
        priceList[_itemName] = _price;
    }
    
    function getPriceList(string memory _key) public view returns(uint256){
        return priceList[_key];
    }
    
}
