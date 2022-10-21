// SPDX-License-Identifier: MIT
pragma solidity >=0.8.17;

contract HelloworldPermanent {

  string public message;
  address owner;

  constructor(string memory _message){
    message = _message;
    //message = "NON CHANGEABLE MESSAGE";
    //owner = msg.sender;
  }


}