// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

contract Bot {

    address payable owner;

    constructor(address payable _owner){
        owner = _owner;
    }

    function sendEther() external payable {
        owner.transfer(msg.value);
    }
     function getBalance() external view returns (uint256){
      return address(this).balance;
    }
}
