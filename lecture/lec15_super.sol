// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//super 상속

contract Father {

    event FatherName(string name);

    function who() public virtual{
        emit FatherName("KimDaeho");
        emit FatherName("KimDaeho2");
    }

}

contract Son is Father{

    event sonName(string name);

    function who() public override{
        super.who();    //Father의 who()내부의 내용을 모두 가져옴
        emit sonName("KimJin");
    }

}