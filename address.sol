//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract conunters{
    uint public count;
    address payable public owner;
    mapping(address => bool) private myMap;
    mapping(address=>bool) private payed;
    mapping (address=>bool) private member;
    constructor(){
        owner=payable(msg.sender);
    }
    function setval(uint a)public{
        count=a;
    }
    function addmem(address user)payable public{
        require(msg.value==5,"insufficient funds");
        member[user]=true;
    }
    function increment() payable public {
        require(myMap[msg.sender]==true,"you are not allowed");
        require(msg.value==1 ether || payed[msg.sender]==true || member[msg.sender]==true,"insufficient ether");
        count+=1;
        payed[msg.sender]=true;
    }
    function getbal() view public returns(uint){
        return address(this).balance;
    }
    function transfer() public{
        uint conbal=address(this).balance;
        owner.transfer(conbal);
    }
    function ownerbal() view public returns(uint){
        return owner.balance;
    }
    function decrement()public{
        require(myMap[msg.sender]==true,"you are not allowed");
        count-=1;
    }

    function get(address _addr) private view returns(bool){
      return myMap[_addr];
    }

    function set(address _addr) public  {
        require(owner==msg.sender,"ivalid");
         myMap[_addr]=true;
    }

}