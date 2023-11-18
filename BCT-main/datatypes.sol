// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.22 <0.9.0;
/// @title A contract for demonstrate Value types
/// @author Jitendra Kumar
/// @notice For now, this contract just show how Value types works in solidity
contract Types {
    // Initializing Bool variable
    bool public boolean = false;
    // Initializing Integer variable
    int32 public int_var = -60313;
    uint public varia = 765;
    // Initializing String variable
    string public str = "Rohith";
    bytes1 public b = "a";
    address public recipient = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // Defining an enumerator
    enum my_enum{ geeks_, _for, _geeks, manjusha }
    // Defining a function to return
    // values stored in an enumerator
    function Enum() public pure returns(my_enum) {
    return my_enum._for;
    }
}
