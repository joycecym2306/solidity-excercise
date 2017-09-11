pragma solidity ^0.4.0;

import "./owned.sol"; //import some contract from another file in the same patch
contract mortal is owned{
	function kill(){
		selfdestruct(owner);
	}
}