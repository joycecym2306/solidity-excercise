pragma solidity ^0.4.0;

contract array{
    uint public counter;
    uint public bytescount;

    function array(){
        counter = 0;
        bytescount =0;
    }

    function f(uint len){
        uint[] memory a = new uint[](7);  //create a new array 'a' with size 7
        bytes memory b = new bytes(len);  //create an array with type bytes
        
        for(uint k=0;k<a.length;k++){
            counter++;
        }
        
        for(uint m=0; m<b.length; m++)
            bytescount++;
    }
    
    function getCounter() returns (uint){
        return counter;
    }
    
    function getbytescount() returns (uint){
        return bytescount;
    }
}


contract C {
 
    //this is a static array, so adding can happen dirrectly
    uint[3] localArray;
    uint[] localDynamic;
    
    function f() {
        //call a function with array and passed in 3 array argument
        g([uint(1), 2, 3]);
    }
    
    //takes an array with 3 elements
    function g(uint[3] _data) returns (uint){
        uint local =0;    
        
        for (uint l=0;l<_data.length;l++){
            local++;
            localArray[l]=_data[l]; //localArray is a static array
            localDynamic.push(_data[l]);    //this is a dynamic array, so need to use push 
        }
        
        //localArray.length = local;
        return local;
    }
    
    function getArrayIndexValue(uint indexValue) returns (uint,uint){
        return (localArray[indexValue],localArray.length);
    }
    
    function getDynamicArray(uint indexValue) returns (uint,uint){
        return (localDynamic[indexValue],localDynamic.length);
    }
    
    
}

contract twoDimension {
    uint [3][5] x;
    
    
    function getLength() returns (uint){
        return x.length;
        
    }
    
    function assignArray(uint[3] record){
        
            for(uint j =0; j<x.length; j++){
                    for(uint k=0;k<3;k++){
                        x[k][j]=1;//this has problem
                    }
            }
    }
    
    function get2Dimension(uint index1,uint index2) returns (uint){
        return x[index1][index2];
    }
}