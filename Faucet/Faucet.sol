pragma solidity ^0.4.19;

contract Faucet{
    address owner;
    uint sendAmount; 
    
    event Transfer (address indexed from, address indexed to, uint tokens);
    
    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }
    
    modifier sendAmountCondition() {
        require(sendAmount <= this.balance);
        _;
    }
    
    function Faucet() public{
        owner = msg.sender;
        sendAmount = 1 ether;
    }
    
    function() public payable{
    }
    
    function getBalance() public view returns(uint){
        return owner.balance;    
    }
    
    function setAmountFromOwner(uint amount) onlyOwner public {
            sendAmount = amount;
    }
    
    function withdraw () sendAmountCondition onlyOwner private{
        owner.transfer(this.balance);
        Transfer(this, owner, sendAmount);
    }
    
    function send(address addr) sendAmountCondition public {
        addr.transfer(sendAmount);
        Transfer(owner, addr, sendAmount);
    }
    
    function ownerWithdraw(uint amount) sendAmountCondition onlyOwner public{
        owner.transfer(amount);
        Transfer(this, owner, amount);
    }
        
    function destruction() onlyOwner public{
        selfdestruct(owner);
    }
}
