// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;

contract coinC{
    uint  data;
    uint public info = 10;

    function increament(uint a) private pure  returns(uint){
       return a +1;
    }

    function updateData(uint a) public {
        data = a;
    }

    function getData() public view returns(uint) {
        return data;
    }

    function compute(uint a, uint b) internal  pure returns(uint){
        return (a + b);
    }
}

contract coinD{
     //coinC coinc;

     coinC coinc = new coinC();

     function readInfo() public view returns(uint) {
         return coinc.info();
        //return info;
     }
}

contract coinE is coinC{
uint private result;
coinC private holdcoinc;

//  constructor (){
//      coinC holdcoinc = new coinC();
//  }

function getcomputeResult()public {
    result = compute(23,4);
}

function getResult()public view returns(uint){
    return result;
}

function getInfo()public view returns(uint ){
    return info;
}
}

