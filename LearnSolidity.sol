// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract LearnSolidity {

// Define different data types and variables

// String - a sequence of characters
string public name = "Param";

// Integer - a whole number
// "int" can be used to define both negative and positive values
int public number = -5;   

// Unsigned integer - a whole number that can only be positive
uint public myNumber = 25;

// Boolean - a true/false value
bool public class = false;
bool public king  = true;

// Address - a 20-byte value that represents an Ethereum address
address public myWallet = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

// Bytes - a fixed-size sequence of bytes
bytes30 public hashh = "hello web3";

// Arrays - a collection of elements of the same data type

// Dynamic array - can have a variable size
string[] public names = ["param", "rahul", "vipin"];

// Fixed-size array - has a defined size that cannot be changed
string[2] public twoNames = ["param", "rahul"];

// Enum - a way to create a custom data type with a set of named values
enum State { PENDING, ACTIVE, INACTIVE }
State public currentState;

// Function to set the current state
function setState(State _state) public {
    currentState = _state;
}

// Function to check if the current state is active
function isActive() public view returns (bool) {
    return currentState == State.ACTIVE;
}

// Struct - a way to create a custom data type that groups together variables of different data types
struct Person {
    string name;
    uint age;
    bool isTrue;
}
Person[] public people;

 function addPerson(string memory _name, uint _age,bool val) public {
     
        Person memory newPerson = Person(_name, _age,val);
       
        people.push(newPerson);

}
// Events

event Transfer(address indexed _to, uint _value);

function sendETH(address add, uint amt) public {
 payable(add).transfer(amt);
 emit Transfer( add ,  amt);
 
}

// modifier
address owner  = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
modifier onlyOwner() {
    require(msg.sender == owner, "Only contract owner can call this function");
    _;
}
// change Owner function
function changeOwner(address newOwner) public onlyOwner {
    owner  =  newOwner;
}
// Constructor : a constructor is a special function that is executed only once when a contract is deployed to the blockchain. It is used to initialize the contract's state variables and perform any other setup tasks that are required. 
uint public myValue;

constructor(uint initiaValue){
    myValue = initiaValue;
}
function setMyVariable(uint newValue) public {
        myValue = newValue;
}

}
