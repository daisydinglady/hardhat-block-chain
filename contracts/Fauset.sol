// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
import "./IERC20.sol";

/**
 * 创建一个ERC20代币的水龙头：要求单个账户单次申请为100单位的代币，每个账户只能申请一次
 * 备注：先创建ERC20代币，再创建水龙头，再申请水
 */

contract Fauset {

    mapping(address => bool) public requestedAddress; //记录已经领取过的账户
    address public tokenContract;  //记录代币的合约地址
    uint256 public allowanceAmount = 100;  //单次发放代币数量

    event SenderToken(address indexed receiver, uint256 amount); //当requestedToken被触发时，释放该事件

    constructor(address _tokenContract) {
        tokenContract = _tokenContract;
    }

    function requestedToken() public returns(bool){
        require(requestedAddress[msg.sender] == false, "Have Received!");
        IERC20 token = IERC20(tokenContract);
       require(token.balanceOf(address(this)) >= allowanceAmount, "Faucet Empty!");

       token.transfer(msg.sender, allowanceAmount);
       emit SenderToken(msg.sender, allowanceAmount);
       return true;
    }

    function testFunc(uint256 a) public pure returns(uint256) {
        return a;
    }
}