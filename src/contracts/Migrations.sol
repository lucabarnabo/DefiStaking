// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.5.0;

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    constructor() public{
        owner= msg.sender;
    }

    modifier restricted(){
        if(msg.sender == owner) _; // guion bajo en solidity significa continuar con la ejecucion.
    }

    function set_completed(uint completed) public restricted{
        last_completed_migration = completed;
    }

    function upgrade() public restricted{
        Migrations upgraded = Migrations{new_address}
        upgraded.set_completed(last_completed_migration)
    }
}