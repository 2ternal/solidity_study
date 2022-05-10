// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//struct(구조체)

contract lec20{

    struct Character{
        uint256 age;
        string name;
        string job;
    }
    
    mapping(uint256=>Character) public CharacterMapping;    //구조체 mapping
    Character[] public CharacterArray;                      //구조체 array
    
    function createCharacter(uint256 _age,string memory _name,string memory _job) pure public returns(Character memory) {   //새 구조체 생성, 기본 데이터 타입이 아니라서 memory필수
        return Character(_age,_name,_job);
    }
    
    function createChracterMapping(uint256 _key, uint256 _age,string memory _name,string memory _job )  public {    //mapping
       CharacterMapping[_key] = Character(_age,_name,_job);
    }
    
    function getChracterMapping(uint256 _key)  public view returns(Character memory){   //mapping에서 값을 가져옴
       return CharacterMapping[_key];
    }
    
    function createChracterArray(uint256 _age,string memory _name,string memory _job ) public {     //array
       CharacterArray.push(Character(_age,_name,_job));
    }
    
    function getChracterArray(uint256 _index)  public view returns(Character memory){   //array에서 값을 가져옴
       return CharacterArray[_index];
    }

}