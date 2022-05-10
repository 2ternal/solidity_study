// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

/*
call :로우레벨 함수 
1. 송금하기
2. 외부 스마트 컨트랙 함수 부르기 
3. 가변적인 gas
4. 이스탄불 하드포크, 2019년 12월이후, gas 가격 상승에 따른, call 사용 권장/ send tranfer = 2300gas 
5. re-entrancy(재진입) 공격위험 있기에, Checks_Effects_Interactions_pattern 사용  
*/

contract add{
    event JustFallback(string _str);
    event JustReceive(string _str);

    function addNumber(uint256 _num1, uint256 _num2) public pure returns(uint256){
        return _num1 + _num2;
    }
    //add 스마트 컨트랙에 없는 함수가 불려질 경우
    fallback() external payable  {
        emit JustFallback("JustFallback is called");
    }

    receive() external payable {
        emit JustReceive("JustReceive is called");
    }
}

contract caller{
    event calledFunction(bool _success, bytes _output);
    //1. 송금하기 
    function transferEther(address payable _to) public payable{
        (bool success,) = _to.call{value:msg.value}("");    //0.7~
        require(success,"failed to transfer ether");
    }
    //2. 외부 스마트 컨트랙 함수 부르기 
    function callMethod(address _contractAddr,uint256 _num1, uint256 _num2) public{
        //abi : 이더리움환경 내에서 스마트 컨트랙을 상호작용시키는 표준 방법
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call( //outputFromCalledFunction : 함수 출력이 바이트화 된 값
            abi.encodeWithSignature("addNumber(uint256,uint256)",_num1,_num2)       //.encodeWithSignature(함수이름(타입),값)
            );
              
        require(success,"failed to transfer ether");
        emit calledFunction(success,outputFromCalledFunction);
    }
    
    function callMethod3(address _contractAddr) public payable{
        
        (bool success, bytes memory outputFromCalledFunction) = _contractAddr.call{value:msg.value}(
            abi.encodeWithSignature("Nothing()")
            );
              
        require(success,"failed to transfer ether");
        emit calledFunction(success,outputFromCalledFunction);
    }
}
/*
현재 스마트 컨트랙의 ABI
[
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "_str",
				"type": "string"
			}
		],
		"name": "JustFallback",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "_str",
				"type": "string"
			}
		],
		"name": "JustReceive",
		"type": "event"
	},
	{
		"stateMutability": "payable",
		"type": "fallback"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_num1",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_num2",
				"type": "uint256"
			}
		],
		"name": "addNumber",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "pure",
		"type": "function"
	},
	{
		"stateMutability": "payable",
		"type": "receive"
	}
]
*/