// SPDX-License-Identifier: SEE LICENSE IN LICENSE

pragma solidity ^0.8.0;

contract SimpleStorage {

    uint256 public favourateNumber; 

    function store(uint256 _num) public {
        favourateNumber = _num;
    }

    function retrive() public view returns(uint256) {
        return favourateNumber;
    }
    
}