// SPDX-License-Identifier:MIT

/**
 * @title ERC20代币空投
 * 1、对特定账户进行一定数量的代币空投
 * 2、要求：空投账户数组长度和空投代币量数组长度相等；空投合约被授权额度大于等于要空投代币总量
 */

pragma solidity ^0.8.0;

import './IERC20.sol';

contract Airdrop {

    function multiTransfer(
        address contractAddress,   //erc20代币合约地址
        address[] memory addresses,  //要空投的地址
        uint256[] memory amounts     //要空投的数量，与地址一一对应
    ) public {
        //要求空投账户数组长度和空投代币量数组长度相等
        require(addresses.length == amounts.length, "Total accounts Not Equal Total Amounts.");
        //创建erc20代币
        IERC20 token = IERC20(contractAddress);
        //要求token被授权额度大于等于要空投代币总量
        uint256 totalAmount = getSum(amounts);
        require(token.allowance(msg.sender, address(this)) >= totalAmount, "Airdrop Token Not Enough.");

        for(uint256 i = 0; i < addresses.length; i++) {
            token.transferFrom(msg.sender, addresses[i], amounts[i]);
        }
    }

    function getSum(uint256[] memory _arr) public pure returns(uint256 sum) {
        for(uint256 i = 0; i < _arr.length; i++ ) {
            sum += _arr[i];
        }
        return sum;
    }

    function multiTransferEth(address payable[] memory _addresses, uint256[] memory _eth) public payable{

        require(_addresses.length == _eth.length, "Address NOt Match Amount.");
        uint256 totalEth = getSum(_eth);
        require(msg.value >= totalEth, "ETH Not Enough.");

        for(uint256 i = 0; i < _addresses.length; i++) {
            _addresses[i].transfer(_eth[i]);
        }
    }

}