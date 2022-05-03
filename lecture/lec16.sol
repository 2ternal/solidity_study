// SPDX-license-Identifier : GPL-30

pragma solidity >=0.7.0 <0.9.0;

//상속 순서

contract Father {

    event FatherName(string name);

    function who() public virtual{
        emit FatherName("KimDaeho");
    }

}

contract Mother {

    event MotherName(string name);

    function who() public virtual{
        emit MotherName("leeSol");
    }

}

contract Son is Father, Mother{
    
    function who() public override(Father,Mother){
        super.who();    //가장 나중(최신)에 상속받은 Mother의 who()가 실행됨
    }

}