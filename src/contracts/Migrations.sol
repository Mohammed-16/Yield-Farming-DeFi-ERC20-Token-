pragma solidity ^0.5.0;

contract Migrations{
    address public owner;
    uint public last_completed_migration;

    constructor() public{
        owner = msg.sender;
    }

    modifier onlyOwner (){
        require(owner == msg.sender, "Only Owner can call this function");
        _;
    }

    function setCompleted(uint completed) public onlyOwner {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public onlyOwner {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}