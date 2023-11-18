// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract KeywordExample {
// State variables
address public owner;
address public target;
uint256 public dataValue;
bool public isPaused;
// Event
event LogEvent(address indexed sender, uint256 value);
// Enum
enum State { Inactive, Active }
// Struct
struct Person {
string name;
uint256 age;
}
// Constructor
constructor() {
owner = msg.sender;
dataValue = 0;
isPaused = false;
}
// Modifier
modifier onlyOwner() {
require(msg.sender == owner, "Only the owner can call this function");
_;
}
// Function
function updateDataValue(uint256 newValue) public onlyOwner {
dataValue = newValue;
emit LogEvent(msg.sender, newValue);
}
// Function that accepts Ether (payable)
function receiveFunds() public payable {
require(msg.value > 0, "Value must be greater than 0");
}
// Fallback function
receive() external payable {
// This function is called when the contract receives Ether
}
}
