pragma solidity ^0.4.11;

contract deleteFunc{

	struct myRecord{
		string name;
		uint age;
	}

	uint data;
	uint [] dataArray;
	myRecord m;

	function asignData(uint _data,uint _dataArray, string _name, uint _age)
	//function asignData(uint _data,uint _dataArray)
	{
		data = _data;

		for(uint i=0; i < _dataArray ; i++){
			dataArray.push(i+1); //dynamic array needs to use 'push'
		}

		m.name = _name;
		m.age = _age;
	}

	function queryAssignData() returns (uint, uint [],string,uint){
		return (data,dataArray,m.name,m.age);
	}

    
	function deleteRecord() returns (uint, uint [], uint, uint[],string,uint,string,uint)
	{
		uint x;
		x = data;  //keeps a copy of data to x
		delete data;  //this should be reset to '0', 
		
		//uint [] storage copyArray = dataArray --> if use 'storage', when the dataArray is used, then copyArray will have no record left
		uint [] memory copyArray = dataArray; //if use 'memory, a copy of the record is kept. 
		delete dataArray;

        // if use 'storage', when m is deleted, the original value in y will be removed too
        //myRecord storage y=m; 
        myRecord memory y;  --> if use 'memory', when m is deleted, the original value still kept in y
        y = m;
        
		delete m;

		return (data,dataArray,x,copyArray,m.name,m.age,y.name,y.age);
	}
    
}