pragma solidity 0.4.8; 


// lets define a simple contract D with payable modifier
contract D {
    uint x;
    function D(uint a) payable {
        x = a;
    }
}


contract C {
    // this is how you can create a contract using new keyword
    D d = new D(4); 
    // this above line will be executed as part of C's constructor

    // you can also create a contract which is already defined inside a function like this
    function createD(uint arg) {
        D newD = new D(arg);
    }


    // You can also create a conract and at the same time transfer some ethers to it.
    function createAndEndowD(uint arg, uint amount) {
        // Send ether along with the creation of the contract
        D newD = (new D).value(amount)(arg);
    }
}