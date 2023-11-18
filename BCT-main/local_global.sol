// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract Variable_Test {
 
 uint public stateVar = 0;
 event SenderAndValue(address sender, uint value);
 function getDouble(uint value) public pure returns (uint)
 {
 uint localVar = value * 2;
 return localVar;
 }
 function increment() public
 {
 stateVar += 1;
 }
 //demonstarte global variable
 function getSenderAndValue() public payable
 {
 address sender = msg.sender;
 uint value = msg.value;
 emit SenderAndValue(sender, value);
 }
}
