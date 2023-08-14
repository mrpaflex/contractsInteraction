// SPDX-License-Identifier: MIT
pragma solidity 0.8.12;
//0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

//0xDA0bab807633f07f013f94DD0E6A4F96F8742B53
//block.timestamp




// contract hashsome{
//    /// uint hash = ;
//     function hashcheck( ) external view returns(uint){
//        return uint(keccak256(abi.encodePacked(block.timestamp)));
//     }
// }

contract Oracle {
    address public  admin;///0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db
    //0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    uint public rand;
    

    constructor(){
        admin = msg.sender;
    }
    modifier  onlyOwner{
        require(admin == msg.sender, "not owner");
        _;
    }

    function inputValue(uint inputVal) public onlyOwner {
         rand = inputVal;
        
    }
}

contract generatehash{
    Oracle oracle;
    constructor(address orancleaddress){
         oracle = Oracle(orancleaddress);
}
    function hashorancle(uint range) public view  returns(uint){
        return uint(keccak256(abi.encodePacked(oracle.rand(), block.timestamp, msg.sender,block.difficulty ))) % range;
    }
}
