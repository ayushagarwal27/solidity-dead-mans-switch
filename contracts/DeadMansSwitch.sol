// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.27;


contract DeadMansSwitch {
    uint lastAction;
    address recipient;
    address owner;

    constructor( address _recipient) payable{
        recipient = _recipient;
        owner = msg.sender;
        lastAction = block.timestamp;
    }

    function withdraw() external {
//        Makes sure that amount can be withdrawn only after or on 52 weeks
        require((block.timestamp - lastAction) >= 52 weeks);

//      Transfer balance of contract to recipient
        (bool isTransferSuccess, ) = recipient.call{value: address(this).balance}("");
        require(isTransferSuccess);
    }

    function ping () external {
//        Only owner who deployed the contract can call ping function
        require(msg.sender == owner, "Only owner can ping");

//        Update block time
        lastAction = block.timestamp;
    }
}