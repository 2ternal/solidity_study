// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

/*
storage : 대부분의 변수(함수 밖의 변수), 함수들이 저장되며, 영속적으로 저장이되어 가스 비용이 비싸다
memory: 함수의 파라미터, 리턴값, 레퍼런스 타입이 주로 저장된다.
    그러나, storage 처럼 영속적이지 않고, 함수내에서만 유효하기에 storage보다 가스 비용이 싸다.
Colldata : 주로 external function 의 파라메터에서 사용된다.
stack:  EVM (Ethereum Virtual Machine) 에서 stack data를 관리할때 쓰는 영역인데 1024Mb로 제한적이다. 이 컨트랙을 상속받은 자식 컨트랙도 접근가능)
*/

contract lec7 {
    
    // string이 기본 데이터타입이 아닌 레퍼런스이다.
    // uint같은 기본 데이터타입은 default가 memory라 명시 안해도 됨
    function get_string(string memory _str) public pure returns(string memory){
        return _str;
    }
}