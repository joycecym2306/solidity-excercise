pragma solidity ^0.4.8;

contract InputOutput{

	uint public constructorInput1;
	address public constructorInput2;
	uint public sum;
	uint public product;
	uint public multiplyByThreeValue;

	// For example, suppose we want our contract to accept  
    //two parameters, we would write something like:
    function InputOutput(uint def_input1,address def_input2){
    	constructorInput1 =  def_input1;
    	constructorInput2 = def_input2;

    }

    // The output parameters can be declared with the same syntax after the returns keyword. 
    // For example, suppose we wished to return  one value: then we would write this:
    function multiplyByThree(uint _param) returns (uint m){
    	multiplyByThreeValue = _param*3;
    	m=multiplyByThreeValue; 
    }


  function multiplyByThree(uint _param) returns (uint m){
    	multiplyByThreeValue = _param*3;
    	m=multiplyByThreeValue; 
    }    

  function multiplyByThreeReturn(uint _param) returns (uint){
    	multiplyByThreeValue = _param*3;
    	
    	return multiplyByThreeValue; 
    }

  function return2Value(uint _param1, uint _param2) returns (uint m,uint n){
    	m = _param1+_param2;
    	n = _param1*_param2; 
    }

    function return2ValueReturn(uint _param1, uint _param2) returns (uint,uint){
    	sum = _param1+_param2;
    	product = _param1*2_param2;

    	return (sum,product);	
    }

}//end of contract