pragma solidity ^0.4.0;

/*
    Array[0] 1,0
    Array[1] 1,0
*/

contract ArrayContract{

    //this is a single dimensional array
	uint [2**3] m_aLotOfIntegers; //static array with size 8

    //this is a 2-dimensional array
    //second[] --> Number of array. In this case. is dynamic array
    //each dynamic array has 2 values (1,0)=means true or false
	bool[2][] m_pairsOfFlags;  //dynamic arrays of pair (means each array is a pair)

	 // newPairs is stored in memory - the default for function arguments
	function setAllFlagPairs (bool [2][] newPairs){
		m_pairsOfFlags = newPairs;
	}

    //if i input the number as thus0,1,1 and 1,0,0
	function setFlagPairs(uint index, bool flagA, bool flagB)
	{
		m_pairsOfFlags[index][0]=flagA;
		m_pairsOfFlags[index][1]=flagB;
	}

	function getSize() returns (uint,uint){
		return (m_aLotOfIntegers.length,m_pairsOfFlags.length);
	} 
	
	function changeFlagArraySize(uint size){
	    m_pairsOfFlags.length=size; //set the size for dynamic array
	}
	
	function getArrayValue(uint index,uint arraynumber) returns (bool){
	    return m_pairsOfFlags[index][arraynumber];
	}
	
	function clear(){
	    //use 'delete to remove arrays
	    delete m_aLotOfIntegers;
	    delete m_pairsOfFlags;
	    
	    m_pairsOfFlags.length=0;
	}

    //first time you enter '0,0' --> Means first array with bool value [0,0]
    //second time you enter '1,1' --> Means second array with bool value [1,1]
    function addFlag(bool[2] flag) returns (uint) {
        return m_pairsOfFlags.push(flag);
    }
    
    bytes m_bytesData;
    
    //input 'helloworld', output '0x68656c6c6f776f726c31' (means 'helloworl1')
    function bytesArray(bytes data) returns (uint,bytes){
        m_bytesData=data;
        m_bytesData[m_bytesData.length-1]='1'; //change the last input character to '1'
        return (m_bytesData.length,m_bytesData);
        
    }
    
    //this function below will convert '0x68656c6c6f776f726c31'  to 'helloworl1'
    function bytes32ToString(bytes32 x) constant returns (string) 
    {
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;
    
        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
        
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }
        
        bytes memory bytesStringTrimmed = new bytes(charCount);
        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }
    
        return string(bytesStringTrimmed);
    }
    
    
    function createDynamicArray(uint size) returns (bytes){
       // uint[2][] memory arrayofPairs = new uint[2][](size);
        
        bytes memory b = new bytes(10);
        for(uint i=0; i<b.length;i++)
            b[i] = byte(i); //b
    
            //return value is 0x00010203040506070809        
            return b;
    }
    
    
    
}//end of contract