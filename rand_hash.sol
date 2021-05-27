// SPDX-License-Identifier: SimPL-2.0
pragma solidity ^0.7.5;

contract rand{
    uint256 public randNonce = 0;
    
    address public owner;

    address public previousAddress;
    constructor() payable
    {
        owner = msg.sender;
    }
    
    //一个随机数，每次调用后，下次结果都不一样，用户越多，随机性越大
    //返回bytes32后，调用程序自己进行处理
    function random() public returns (bytes32) {
        
        previousAddress = msg.sender;
        randNonce++;
        bytes32 random_hash = keccak256(abi.encodePacked(msg.sig , msg.sender, randNonce, blockhash(block.number -1),previousAddress));
        return random_hash;
    }

    // transfer balance to owner
	function withdraw(uint256 amount) public {
		require(msg.sender == owner);
		msg.sender.transfer(amount);
	}
	
	//转移所有者 
	function setOwner(address newOwner) public{
	    require(msg.sender == owner);
		owner = newOwner;
	}
}