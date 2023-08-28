// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

interface IERC20 {

    // 当放生转账时，记录FROM账户、TO账户，以及转账金额
    event Transfer(address indexed from, address indexed to, uint256 value);

    // 当发生授权行为是，记录授权方、被授权方地址，以及授权金额
    event Approve(address indexed owner, address indexed spender, uint256 value);

    // 代币总供给
    function totalSupply() external view returns(uint256);

    // 账户余额
    function balanceOf(address account) external view returns(uint256);

    // 转账
    function transfer(address _to, uint256 value) external returns(bool);

    // 授权
    function approve(address spender, uint256 value) external returns(bool);

    // 授权转账
    function transferFrom(address _from, address _to, uint256 value) external returns(bool);

    // 授权金额
    function allowance(address owner, address spender) external view returns(uint256);

}