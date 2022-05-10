// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

/*
    1 ether = 10^9 gwei = 10^18wei
    0.000000000000000001 = 1^-18 =1wei
    0.01 ether = 10^16 gwei
    uint256 public value = 1 ether;
    uint256 public value2 = 1 wei;
    uint256 public value3 = 1 gwei;
    gwei => 가스비를 지불할 때 쓰는 단위
    스마트 컨트랙트가 짧을수록 가스비가 적음
    스마트 컨트랙트가 실행될 때마다 가스비가 적용되므로 디도스공격을 막을 수 있음
*/

contract lec3{
    uint256 public value = 1 ether;
    uint256 public value2 = 1 wei;
    uint256 public value3 = 1 gwei;
}