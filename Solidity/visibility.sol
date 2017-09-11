

/*
external
	-> Can be called from other contract
	-> Cannot be called internally (need to use this.)

internal
	-> Can only be called internally and from contract that inherit

// private - only visible in the current contract
// internal - only visible in current contract, and those deriving from it

public
	-> Can be called internally and via messages

private
	-> Only can be called internally

*/

pragma solidity ^0.4.8;

contract C {

	uint private data;

    // private - only visible in the current contract and must be call by another function within this contract
	function f(uint a) private returns (uint b){
		return a+1;

	}

    //only this function can call function f() 
	function callf(uint a) private returns (uint){
	    return f(a);
	    
	}
	
	function setData(uint a) {
		data = a;
	}

	function getData() public returns (uint) {
		return data;
	}

    //setting as 'internal' means that this function can only be access 
    //inside another function by the contract inheritor
	function compute(uint a,uint b) internal returns (uint){
		return a+b;
	}
	
	

}

contract D{

    C c = new C();
    uint local;
    
	function readData() returns (uint){
		//local = c.f(7); --> this wont work because is private 
		c.setData(3);
		local = c.getData();
        return local;

	}
	
	/* the function c.compute is not visible to this contract
	function Compute(uint a,uint b) returns (uint){
	    local = c.compute(a,b);
	    return local;
	}
	*/
}


//since contract C is inherited by E, so E can access all the functions in E, except private
contract E is C{

    function g() returns (uint){
        uint val;
        val = compute(2,3);
        return val;
    }
    
}