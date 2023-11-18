// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;
contract SimpleStorage
{
uint storedData;
uint firstno;
uint secondno;
function setfirst(uint x) public{
firstno=x;
}
function setsecond(uint x) public{
secondno=x;
}
function add() public view returns (uint){
return firstno+secondno;
}
function sub() public view returns (uint){
return firstno-secondno;
}
function multiply() public view returns (uint){
return firstno*secondno;
}
function div() public view returns (uint){
return firstno/secondno;
}
function mod() public view returns (uint){
return firstno%secondno;
}
function incre() public returns(uint){
return ++firstno;
}
function decre() public returns(uint){
return --firstno;
}
}
