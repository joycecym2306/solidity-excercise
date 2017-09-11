pragma solidity ^0.4.0;

contract mortal {
	address public owner;

	//this is a constructor 
	function mortal(){
		owner = msg.sender; //a predefined object in solidity as the message sender
	}


	//certain functions will only be executed when it is under the modifier condition
	modifier onlyOwner{
		require(msg.sender==owner);
		_;
	}
	

	//this function makes the contract not functional anymore
	//basically makes the contract dead
	//the modifier onlyOwner means the  kill function can be only be executed by the owner
	function kill() onlyOwner{
		suicide(owner);   //the predefined object in solidity. after kill all remaining ether will be sent back to owner
	}

	function DisplayAddress() public returns (address){
		return owner;
	}
}

//make contract User inherit some properties from Contract Mortal
contract User is mortal {
	
	string public userName;

	//mapping allows the use one type of variable as an index to an array
	//we need an address for each of those services
	//each provider has an address. So it makes sense to make the address of each of the Provider
	mapping(address=>Service) public services;

	//create a structure for services engaged by the User to the Provider
	//could be electricity or cellphone Service
	struct Service{
		bool active;   //true or false
		uint lastUpdate;	//the last time the Service is updated
		uint256 debt;	//for ethereum amount, must use uint256
	}

    //this is a constructor. which will be provided when the contract deployed 
	function User(string _name){
		userName = _name;
	}

	//only the owner of this contract can register for this provider
	function registerToProvider(address _providerAddress) onlyOwner{
		services[_providerAddress] = Service({
			active:true,
			lastUpdate:now,
			debt:0
			});
	}

	//the keyword payable is required so that mist wont throw error when setting a amount to the User Service Debt
	function setDebt(uint256 _debt) payable{
		if(services[msg.sender].active){
			services[msg.sender].lastUpdate=now;
			services[msg.sender].debt = _debt;
		}
		
	}

	function clearDebt(address _providerAddress, uint256 _debt) payable{
		if(services[_providerAddress].active==true)
		{
			services[_providerAddress].lastUpdate=now;
			if(_debt > services[_providerAddress].debt)
			{
				services[_providerAddress].debt=0;
			}
			else
			{	
				services[_providerAddress].debt-=_debt;
			}
		}
	}

	//send the exact amount that's in the debit, Can't use 'send'. Must use 'transfer'
	//must use the keyword 'payable' to avoid insufficent gas when execute the transaction
	function payToProvider(address _providerAddress) payable{
		_providerAddress.transfer(services[_providerAddress].debt);

	}

	function unsubscribe(address _providerAddress)
	{
		if(services[_providerAddress].active)
		{
			services[_providerAddress].lastUpdate=now;
			services[_providerAddress].active = false;	
		}
	}

	function queryProvider(address _providerAddress) internal returns (Service)
	{
		return services[_providerAddress];
	}

}


//make contract Provider inherit some properties from Contract Mortal
contract Provider is mortal{

	string public providerName;
	string public description;

	//this is a constructor. which will be provided when the contract deployed
	function Provider(string _name,string _description){
		providerName = _name;
		description = _description;

	}

	//the keyword payable is required so that mist wont throw error when setting a amount to the User Service Debt
	function setDebt(uint256 _debt,address _userAddress) payable {
		User person = User(_userAddress); //declare a new type of object User, that gets all the functionality of the User Contract
		person.setDebt(_debt); //this calls the setDebt in the User Contract
	}
}

