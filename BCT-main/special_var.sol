// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;
contract GlobalVariablesExample {
 address public owner;
 constructor() {
 owner = msg.sender;
 }
 function getOwner() public view returns (address) {
 return owner;
 }
 function isOwner(address _address) public view returns (bool) {
 return _address == owner;
 }
 function sendEther(address payable _recipient) public payable {
 require(msg.sender == owner, "Only the contract owner can send 
ether.");
 _recipient.transfer(msg.value);
 }
 function getCurrentBlock() public view returns
(uint256,uint256,address){
 return (block.number, block.timestamp, block.coinbase);
 }
}