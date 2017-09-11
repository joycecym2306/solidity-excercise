pragma solidity ^0.4.0;

contract MappingExample {
	mapping (address => uint) public balances;

	function update(uint newBalance){
		balances[msg.sender] = newBalance;
	}
	
	function queryBalance() returns (uint){
	    return balances[msg.sender];
	}

}

contract MappingUser {

	MappingExample m = new MappingExample();
	
	function f(uint _balUpdate) returns (uint){

		m.update(_balUpdate);

		return m.balances(this);
	}
	
	function queryBalance() returns (uint){
	    return m.queryBalance();
	}
}

//mapping a structure
contract structFunder {
    
    uint public funderId;
    
    function structFunder() {
        funderId=0;
    }
    
    struct Funder {
        address _addr;
        uint amount;
    }
    
    mapping (uint => Funder) funders;
    
    function PopulateFunders(uint _amount){
        funders[funderId]=Funder({_addr:msg.sender,amount:_amount});
        funderId++;
    }
    
    function ChangeFunderAmount(uint funderId,address _newAddress, uint amount){
        funders[funderId]._addr = _newAddress;
         funders[funderId].amount = amount;
    }
    
    function FunderCount() returns (uint){
        return funderId;   
    }
    
    function queryFunder(uint _funderId) returns (address,uint){
        return(funders[_funderId]._addr,funders[_funderId].amount);
    }
    
}