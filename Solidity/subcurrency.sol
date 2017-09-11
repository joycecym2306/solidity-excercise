pragma solidity ^0.4.0;

contract Parent{
	
	address public owner;
	mapping (address=>uint) balances;

	function parent(){
		owner = msg.sender;
	}

	modifier onlyOwner{
		require(msg.sender==owner);
		_;
	}


	function kill() onlyOwner{
		suicide(owner);
	}

	function DisplayAddress() public returns (address){
		return owner;
	}
	
	function queryBalance() returns (uint){
		return balances[owner];
	}


}

contract Minter is Parent{

	string public MinterName;
	address public minter;

	mapping(address=>uint) account;

	function Coin(string _minterName){
		MinterName = _minterName;
	}	

	
	function MintCoin(uint _amount){
		if(minter != msg.sender)
			return;
		//minter balances increases, so that can sell later	
		account[minter]+=_amount;
	}


}
