// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

//new owner 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2

contract costex{
    address owner = msg.sender;
    mapping(address=> uint) public balances;
    uint amount = 200 ether;


    modifier costs( uint _cost){
        require(msg.value >= amount, "Not Ether provided");
        _;
    }

    function mintcoin( uint _value) public{
        balances[owner] += _value;
    }

    function forceownerChange(address _newowner) payable  public costs(amount){
        owner = _newowner;
    }
}