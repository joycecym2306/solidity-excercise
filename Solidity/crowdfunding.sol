pragma solidity ^0.4.0;

contract CrowdFunding {

	struct Funder {
		address addr;
		uint amount;
	}

	//x number of campaign, with each campaign has a y number of funders
	struct Campaign{
		address beneficiary;
		uint fundingGoal;
		uint numberFunders;
		uint amount;
		mapping (uint => Funder) funders;
	}

	uint numCampaign=0;

	mapping (uint => Campaign) campaigns;

	//create a new campaign
	function newCampaign (address _beneficiary, uint _goal) returns (uint campaignId){
		campaignId =  numCampaign++;

		// Creates new struct and saves in storage. We leave out the mapping type.
		campaigns[campaignId]=Campaign(_beneficiary,_goal,0,0);
	}

	function new2Campaign (address _beneficiary, uint _goal) returns (uint campaignId){
		campaignId =  numCampaign++;

		// Creates new struct and saves in storage. We leave out the mapping type.
		campaigns[campaignId]=Campaign({beneficiary:_beneficiary,fundingGoal:_goal,numberFunders:0,amount:0});
	}
	
	function contributetoCampaign(uint _campaignId, address _funderAddr,uint _amount) payable {
		// Creates a new temporary memory struct, initialised with the given values
        // and copies it over to storage.
        // Note that you can also use Funder(msg.sender, msg.value) to initialise.
		Campaign storage c = campaigns[_campaignId];

		c.funders[c.numberFunders]=Funder({addr:_funderAddr,amount:_amount});
		c.numberFunders++;  //increase the number of funders
		c.amount += _amount; //increase the total campaign Amount
	}

	function queryCampaign(uint _campaignId) returns (address, uint, uint, uint){
		return (campaigns[_campaignId].beneficiary,campaigns[_campaignId].fundingGoal,campaigns[_campaignId].numberFunders,campaigns[_campaignId].amount);
	}


	function queryFunderInformation(uint _campaignId,uint _funderId) returns (address,uint){
		Campaign storage d = campaigns[_campaignId];
		return (d.funders[_funderId].addr,d.funders[_funderId].amount);
	}
	
	function checkGoalReach (uint _campaignId) payable returns (bool reached){
	    Campaign storage e = campaigns[_campaignId];

        if(e.amount >= e.fundingGoal)
        {
            //transfer the amounbt to beneficiary
            uint amount = e.amount;
            e.amount =0;
            //e.beneficiary.transfer(amount); --> This part has compile error
            return true;
        }
        else
            return false;
	}       
       
} //end of contract