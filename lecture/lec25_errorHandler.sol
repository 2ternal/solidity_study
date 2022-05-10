// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

// 에러핸들러: require, revert, assert
// 0.4.22 ~ 0.7.x 버전

contract lec25{
    
/*
    0.4.22 ~ 0.7.x 버전
    assert : gas를 다 소비한후, 특정한 조건에 부합하지 않으면 (false일 때) 에러를 발생시킨다.
    revert: 조건없이 에러를 발생시키고, gas를 환불 시켜준다. 
    require: 특정한 조건에 부합하지 않으면(false일 때) 에러를 발생시키고, gas를 환불 시켜준다.
*/
//3000000 gas 소비
//보통 비용이커서 test할 때 많이 사용
    function assertNow() public pure{
        assert(false);      //false에서 에러 발생 
    }  
//21322 gas 소비
//condition을 체크하고 smart contract를 작성할 때 주로 사용
    function revertNow() public pure{
        revert("error!!");  // 무조건 에러 발생, 에러 메세지 출력
    }
//21338 gas
//if or require = if + revert;
    function requireNow()public pure{
        require(false,"occurred");  //false에서 에러 발생
    }

    function onlyAdults(uint256 _age) public pure returns(string memory){
        if( _age < 19){
            revert("You are not allowed to pay for the cigarette");
        }
        return "Your payment is scceeded";
    } 
    //위와 같은 작동 코드
    function onlyAdults2(uint256 _age) public pure returns(string memory){
        require(_age > 19,"You are not allowed to pay for the cigarette");  //false에서 에러 발생
        return "Your payment is scceeded";
    } 

}