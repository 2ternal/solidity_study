// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//array
//solidity에서는 mapping을 더 선호함 -> 순회로 인해 디도스 공격에 취약할 수 있음
//array의 크기를 50으로 제한하는 편

contract lec18{
    
    //array의 생성 방법
    uint256[] public ageArray;
    uint256[10] public ageFixedSizeArray;
    string[] public nameArray= ["Kal","Jhon","Kerri"];
  
    function AgeLength()public view returns(uint256) {  //array의 length
        return ageArray.length;
    }
    
    function AgePush(uint256 _age)public{   //array에 추가(push)
        ageArray.push(_age);
    }

    function AgeChange(uint256 _index, uint256 _age)public{ //array 변경
        ageArray[_index] = _age;
    }

    function AgeGet(uint256 _index)public view returns(uint256){    //array indexing
        return ageArray[_index];
    }

    function AgePop()public {   //array pop
        ageArray.pop();
    }
    
    function AgePop(uint256 _index)public { //array 내부 특정 위치의 값 삭제(delete) -> length는 변하지 않고 값이 null(0)로
        delete ageArray[_index];
    }

}