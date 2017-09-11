pragma solidity ^0.4.0;

contract owned{
	address public owner;

	function owned(){
		owner = msg.sender;
	}
}