// SPDX-license-Identifier : GPL-30

pragma solidity >=0.5.0 <0.9.0;

//fallback, receive

/*
fallback 함수는 이름 그대로 대비책 함수

0.6이전의 fallback
특징 
1. 먼저 무기명 함수, 이름이 없는 함수입니다.
2. external 필수 
3. payable

쓰는 이유?
1. 스마트 컨트랙이 이더를 받을 수 있게 한다.
2. 이더 받고 난 후 어떠한 행동을 취하게 할 수 있다. 
3. call함수로 없는 함수가 불려질때, 어떠한 행동을 취하게 할 수 있다. 
0.6 이전 
function() external payable {
    
}

0.6 이후 fallback 
fallback은 recevie 와 fallback으로 두가지 형태로 나뉨
receive: 순수하게 이더를 받을때만 작동한다.
fallback: 함수를 실행하면서 이더를 보낼때, 불려진 함수가 없을 때 작동한다.
0.6 이후 
기본형 :  불려진 함수가 특정 스마트 컨트랙이 없을때 fallback 함수가 발동한다. 
fallback() external {   //payable를 안써줘도 됨
   
}
payable 적용시 : 이더를 받고 나서도 fallaback 함수가 발동합니다. 
fallback() external payable {
   
}
receive() external payable{
    
}
*/
contract Bank{
    //사용자(이더를 보내는 사용자)의 주소, 보내는 이더 값, 메세지
    event JustFallbackWIthFunds(address _from,uint256 _value ,string message);
    //~0.6 
    //이더를 받는다
    function() external payable {   
        emit JustFallbackWIthFunds(msg.sender, msg.value,"JustFallbackWIthFunds is called");
    }

}

contract You{
    //receve() 
    //_to에게 이더를 보내는 함수(send)
    function DepositWithSend(address payable _to) public payable{
        bool success = _to.send(msg.value);
        require(success, "Failled" );
    }
    //_to에게 이더를 보내는 함수(transfer)
    function DepositWithTransfer(address payable _to) public payable{
        _to.transfer(msg.value);
    }
    //_to에게 이더를 보내는 함수(call)
    function DepositWithCall(address payable _to) public payable{
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("");
        require(sent,"Failed to send either");
        
        //0.7 ~
        // (bool sent, ) = _to.call{value: msg.value}("");
        // require(sent, "Failled" );
    }
    //fallback()
    //이더를 보내지 않는 경우
    //Bank에 Hi라는 함수가 없어서 fallback에 걸림
    function JustGiveMessage(address _to) public{   
        // ~ 0.7
        (bool sent, ) = _to.call("HI");
        require(sent,"Failed to send either");
        
        //0.7 ~
        // (bool success, ) = _to.call("HI");
        // require(success, "Failled" );
    }
    //To the fallback() with Funds
    function JustGiveMessageWithFunds(address payable _to) public payable{
        // ~ 0.7
        (bool sent, ) = _to.call.value(msg.value)("HI");
        require(sent,"Failed to send either");
        
        //0.7 ~
        // (bool success,) = _to.call{value:msg.value}("HI");
        // require(success, "Failled" );
    }
    
}

/*
Bank 주소 : 0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3
You 주소 : 0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99
보낸 계정 : 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
보낸 이더 : 2 Ether
Bank의 msg.sender는 You이고
You의 msg.sender는 Acount이다.
[
	{
		"from": "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3",       
		"topic": "0x4c8d02d9c4c7786fdc1eca57ebd3da262572813098673db45562a50e2d935f89",
		"event": "JustFallbackWIthFunds",
		"args": {
			"0": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"1": "2000000000000000000",
			"2": "JustFallbackWIthFunds is called",
			"_from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"_value": "2000000000000000000",
			"message": "JustFallbackWIthFunds is called"
		}
	}
]

[
	{
		"from": "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3",
		"topic": "0x4c8d02d9c4c7786fdc1eca57ebd3da262572813098673db45562a50e2d935f89",
		"event": "JustFallbackWIthFunds",
		"args": {
			"0": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"1": "2000000000000000000",
			"2": "JustFallbackWIthFunds is called",
			"_from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"_value": "2000000000000000000",
			"message": "JustFallbackWIthFunds is called"
		}
	}
]

[
	{
		"from": "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3",
		"topic": "0x4c8d02d9c4c7786fdc1eca57ebd3da262572813098673db45562a50e2d935f89",
		"event": "JustFallbackWIthFunds",
		"args": {
			"0": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"1": "2000000000000000000",
			"2": "JustFallbackWIthFunds is called",
			"_from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"_value": "2000000000000000000",
			"message": "JustFallbackWIthFunds is called"
		}
	}
]

[
	{
		"from": "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3",
		"topic": "0x4c8d02d9c4c7786fdc1eca57ebd3da262572813098673db45562a50e2d935f89",
		"event": "JustFallbackWIthFunds",
		"args": {
			"0": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"1": "0",
			"2": "JustFallbackWIthFunds is called",
			"_from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"_value": "0",
			"message": "JustFallbackWIthFunds is called"
		}
	}
]

[
	{
		"from": "0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3",
		"topic": "0x4c8d02d9c4c7786fdc1eca57ebd3da262572813098673db45562a50e2d935f89",
		"event": "JustFallbackWIthFunds",
		"args": {
			"0": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"1": "2000000000000000000",
			"2": "JustFallbackWIthFunds is called",
			"_from": "0x9D7f74d0C41E726EC95884E0e97Fa6129e3b5E99",
			"_value": "2000000000000000000",
			"message": "JustFallbackWIthFunds is called"
		}
	}
]

*/