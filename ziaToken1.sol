// SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;

import"https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

contract ZiaToken is ERC20 {

    address public owner;
    address referenceAccount = 0x9A020cFcA5F5CFcE8FE48E92c55eB14C07A6495d;

    constructor() ERC20("zia token", "ZT") {
        _mint(address(this), 100 * 10 ** 18 );
        owner = msg.sender;
    }

    function distributeToken(uint256 _amount) external returns(bool success) {

        uint256 burnShare = (20 * _amount)/100;
        uint256 ownersShare = (30 * _amount)/100;
        uint256 referenceShare = (50 * _amount)/100;

        _burn(address(this), burnShare);
        _transfer(address(this), owner, ownersShare);
        _transfer(address(this), referenceAccount, referenceShare);

        return true;
    }
}
