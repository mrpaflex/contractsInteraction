// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract coin{
    address public owner;
    mapping(address => uint) public balances;
    event Sent( address from, address _to, uint _amount);
  

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner{
    require(owner == msg.sender, "you are not the owner");
    _;
}

    function mintCoin(address receiver, uint amount) public onlyOwner {
        balances[receiver] = balances[receiver] + amount;
    }


    function send(address from, address to, uint amount)   public onlyOwner {
        require(amount < balances[from], "insulficient fund");
        balances[from] -=amount;
        balances[to] +=amount;
        emit Sent(from, to, amount);
    }


}