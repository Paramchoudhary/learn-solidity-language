// SPDX-License-Identifier: GPL-3.0

/* 
   The following syntax is called Version Pragma. 
   
   It is used because solidity get updates regularly to introduce new features and to remove loopholes in the language. 

   So the solidity code which is syntactically and semantically correct in one version may not be correct in 
   the latest version. This gives solidity compiler the version or range of versions the written code is correct. 
   
   Note: version pragma doesn't change the version of the compiler, it just instructs the compiler the current version matches
        the version mentioned in the source code file. If it doesn't match it throws an error

*/
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

// View vs Pure
uint public a = 1;

// View functions may only read the state of the contract
function addView(uint b) public view returns (uint) {
    return a+b;
}

//Pure function does not read or write the state variables
function addPure(uint x, uint y) public pure returns (uint) {
    return x + y;
}
//mapping helps to keep track of keys and it values(a good example of key and value is wallet and amount)
mapping(address => uint) public balanceof;


 event Log(string message);
 
// Global Variables
function paySent() public payable {
    require(msg.sender == tx.origin); // msg.sender = caller of function, tx.origin = origin of transaction
    amount = msg.value; // Amount of ether sent alongside the transaction
}

// function visiblity

// Can be called outside SC and called by another function
function checkVisibility() public { 
}

// Cannot be called outside SC but can be called inside of another function in thesame SC
function checkVisibility1() private { 
}

// Can only be called outside the SC
function checkVisibility2() external { 
}

// Can only be called inside the SM from another function
function checkVisibility3() internal { 
}

// There are two types of functions in solidity write functions and read functions 

// This is a write function so you have to pay a gas fee to call function
function setValue(string memory _age) public {  
    age = _age;
}

// While with the read function is completely free
function getValue() public view returns (string memory) { 
    return age;
}

// Operators in solidity 

// Equal to
function eq(uint q, uint w) external pure returns(bool) {  
    return q == w;
}

// Not Equal to
function notEq(uint q, uint w) external pure returns(bool) { 
    return q != w;
}

// Greater than
function gT(uint q, uint w) external pure returns(bool) { 
    return q > w;
}

// Less than
function lT(uint q, uint w) external pure returns(bool) { 
    return q < w;
}

// Greater than Equal to
function gTEq2(uint q, uint w) external pure returns(bool) { 
    return q >= w;
}

// Less than Equal to
function lTEq2(uint q, uint w) external pure returns(bool) { 
    return q <= w;
}

 // Addition 
function add(uint q, uint w) external pure returns(uint) {
    return  q + w;
}

// Subtraction 
function  sub(uint q, uint w) external pure returns(uint) { 
    return q - w;
}

// Division 
function div(uint q, uint w) external pure returns(uint) { 
    return q / w;
}

// Multiplication 
function mul(uint q, uint w) external pure returns(uint) { 
    return q * w;
}

// Exponents
function exp(uint q, uint w) external pure returns(uint) { 
    return q ** w;
}

// Modulus
function mod(uint q, uint w) external pure returns(uint) { 
    return q % w;
}

// Bitwise Xor
function xor(uint q, uint w) external pure returns(uint) { 
    return q ^ w;
}

// Increment
function inc(uint q) external pure returns(uint) { 
    q++;
    return q;
}

// Decrement
function dec(uint q) external pure returns(uint) { 
    q--;
    return q;
}

// And making sure both things are true
function and(bool q, bool w) external pure returns(bool) { 
    return q && w;
}

// Or either one of the variables is true
function or(bool q, bool w) external pure returns(bool) { 
    return q || w;
}

// Check if something is not true
function not(bool q) external pure returns(bool) { 
    return !q;
}

function addExample() external pure returns(bool) {
    return (1+1 == 2) && (2+2 == 4);
}

// Conditionals in Solidity

// if q % 2 == 0 return 'even', else return 'odd'
function evenOrOdd(uint q) public pure returns (string memory) {
    if(q % 2 == 0) {  
        return "even";
    } else {
        return "odd";
    }
}

function evenOrOdd1(uint q) public pure returns (string memory) {
    if(q % 2 == 0) {
        return "even";
    }
    return "odd";
}

function evenOrOdd2(uint q) public pure returns (string memory) {
    return q % 2 == 0 ? "even" : "odd";
} 

// Mappings - Key value pairs used to store information inside SC

mapping(uint => address) public accountBalance;
mapping(uint => string) public name;
mapping(address => uint) public addresses;
mapping(address => bool) public hasVoted;

// Nested mapping - mapping inside a mapping
mapping(address => mapping(uint => bool)) public myMapping; 

// Error Handling
function example1(uint _amount) public {
    require(_amount > 10, "must be greater than 10");
    emit Log("success");
}

function example2(uint _amount) public {
    if(_amount <= 10) {
        revert("must be greater than 10");
    }
    emit Log("success");
}

=======
//nested mapping used to keep track of events involving multi users
//mapping(address => mapping(address => uint) public allowance;
//>>>>>>> main

//Try Catch
function divide(uint256 a, uint256 b) public returns (uint256) {
    uint256 result;
    try this.doDivide(a, b) returns (uint256 _result) {
      result = _result;
    } catch {
      revert("Division by zero");
    }
    return result;
  }

  function doDivide(uint256 a, uint256 b) public pure returns (uint256) {
    require(b != 0, "Division by zero");
    return a / b;
  }
  

//For loop
    function sum(uint[] memory numbers) public pure returns (uint) {
       uint total = 0;
       for (uint i = 0; i < numbers.length; i++) {
           total += numbers[i];
       }
       return total;
    }
// While loops

    function factorial(uint n) public pure returns (uint) {
        uint result = 1;
        while (n > 0) {
            result *= n;
            n--;
        }
        return result;
    }

   
    
}
