// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 < 0.9.0;

//enum

/*
/enum: 사람이 읽을수 있게, 사용자/개발자에 의해 정의된 상수세트 타입 (uint8 = 0~255(2^8-1))
    enum 이름 {
    }
    특정한 상태 조건을 정의
*/

contract lec38{
    
    enum CarStatus{ //자동차의 상태 0~3
        TurnOff,
        TurnOn,
        Driving,
        Stop
    }
    
    CarStatus public carStatus;
    
    constructor(){
        carStatus = CarStatus.TurnOff;
    }
    
    event carCurrentStatus(CarStatus _carStatus, uint256 _carStatusInInt);
    
    function turnOnCar() public {   //차 시동을 켠다
        require(carStatus == CarStatus(0), "To turn on, your car must be turned off");
        carStatus = CarStatus(1);
        emit carCurrentStatus(carStatus,uint256(carStatus));    //타입이 carStatus이기 때문에 형변환 필요
    }
    

    function DrivingCar() public {  //차를 운전한다
        require(carStatus == CarStatus.TurnOn, "To drive a car, your car must be turned on");
        carStatus = CarStatus.Driving;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    
    function StopCar() public {     //차를 멈춘다
        require(carStatus == CarStatus.Driving, "To drive a car, your car must be turned on");
        carStatus = CarStatus.Stop;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }
    
    function turnOffCar() public {  //차 시동을 끈다
        require(carStatus == CarStatus.TurnOn 
                || carStatus == CarStatus.Stop , "To turn off, your car must be turned on or driving");
        carStatus = CarStatus.TurnOff;
        emit carCurrentStatus(carStatus,uint256(carStatus));
    }

    function CheckStatus() public view returns(CarStatus) {
        return carStatus;
    }
}