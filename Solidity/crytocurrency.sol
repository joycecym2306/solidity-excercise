pragma solidity ^0.4.8;

contract CrytoCurrency{

address public minter;
uint public totalCoins;

event LogCoinMinted(address deliveredTo, uint amount);
event LogCoinSent(address sentTo, uint amount);

mapping (address=>uint)balances;

function Coin(uint initialCoin){
	minter = msg.sender;
	totalCoins = initialCoin;
	balances[minter]=initialCoin;
}

function mint(address owner, uint amount){
	if(msg.sender!=minter)
		return;

	balances[owner] += amount;
	totalCoins += amount;

	LogCoinMinted(owner,amount);	
}

function send(address receiver, unit amount){
	balances[msg.sender]-=amount;
	balances[receiver]+=amount;
	LogCoinSent(receiver,amount);	
}

function queryBalance(address addr) returns (uint balance){
	return balances[addr];
}

function killCoin() returns (bool status){
	require(msg.sender==minter);
	suicide(minter);
}

} //end of contract