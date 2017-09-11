pragma solidity ^0.4.0;

contract Miner{

	address public minerAddr;
	uint public hello;
    string public msg;

	function Miner(){
		hello = 55;
		msg = "Hello World";
	}

	function callMinerInfo() public returns (uint){ 
	    return hello;
	}

    function addMiner(uint a,uint b) returns (uint){
        return(a+b);
    } 
    
    function multiplyMiner(uint a,uint b) returns (uint){
        return (a*b);
    }
    
    function getMessage() returns (string){
        return msg;
    }
}

contract FunctionCall{
	uint public InitialValue;
	uint public addition; 
	string public message;
	
	//constructor
	function FunctionCall(uint _value){	
		InitialValue = _value;
	}
	
	function queryInitialValue() returns (uint,string){
		return (InitialValue,message);
	}
	
    Miner m = new Miner(); //must create new object first 
	    
	function callMinerInfo() returns (uint){ 
	    InitialValue = m.callMinerInfo();
	}
	
	function callAddMiner(uint a,uint b) returns(uint){
	    InitialValue = m.addMiner(a,b);
	}
	
	function callmultiplyMiner(uint a,uint b) returns(uint){
	    InitialValue = m.multiplyMiner(a,b);
	}
	
	/* Passing string between contracts is not supported now
	function callMsg() returns (string){
	    message = m.getMessage();
	}
	*/
}





