// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//overriding

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
    
    function getMoney() view  public virtual returns(uint256){      //overriding될 함수에는 virtual
        return money;
    }
    
}

contract Son is Father("James"){
    
    /*  Father의 "James"를 지우고 아래와 같이 작성 가능
    constructor() Father("James"){
        
    }
    */
    uint256 public earning = 0;
    function work() public {
        earning += 100;
    }
    
     function getMoney() view  public override returns(uint256){    //overriding된 함수에는 override
        return money+earning;
    }

}