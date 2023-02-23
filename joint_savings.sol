pragma solidity ^0.5.0;

contract Wallet {
    address payable Stash;
    address payable Controller;
    address public last_Authorized;
    uint public Authorized_Amount;
    uint public Remaining_Balance;
    
    function withdraw(uint amount, address payable recipient) public {
        require(recipient == Stash || recipient == Controller, "You don't own this account!");
        require(address(this).balance >= amount, "Insufficient Funds!");
        if (last_Authorized != recipient){
            last_Authorized = recipient;
        }
        recipient.transfer(amount);
        Authorized_Amount = amount;
        Remaining_Balance = address(this).balance;
    }

    function deposit() public payable {
        Remaining_Balance = address(this).balance;
    }

    function setAccounts(address payable account1, address payable account2) public{
        Stash = account1;
        Controller = account2;
    }

    function() external payable {

    }
}