// SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
import "./IERC20.sol";

contract ERC20 is IERC20 {

    uint256 public override totalSupply;
    mapping(address => uint256) public override balanceOf;
    mapping(address => mapping(address => uint256)) public override allowance;
    string public name;
    string public symbol;
    address deployer;

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        deployer = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == deployer, "Not the owner.");
        _;
    }


    function transfer(address _to, uint256 value) public override returns(bool) {
        balanceOf[msg.sender] -= value;
        balanceOf[_to] += value;
        emit Transfer(msg.sender, _to, value);
        return true;
    }

    function approve(address spender, uint256 value) public override returns(bool) {
        allowance[msg.sender][spender] = value;
        emit Approve(msg.sender, spender, value);
        return true;
    }

    function transferFrom(address from, address to, uint256 value) public override returns(bool) {
        allowance[from][msg.sender] -= value;
        balanceOf[from] -= value;
        balanceOf[to] += value;
        emit Transfer(from, to, value);
        return true;
    }

    function mint(uint256 value) public onlyOwner {
        balanceOf[msg.sender] += value;
        totalSupply += value;
        emit Transfer(address(0), msg.sender, value);
    }

    function burn(uint256 value) public onlyOwner {
        balanceOf[msg.sender] -= value;
        totalSupply -= value;
        emit Transfer(msg.sender, address(0), value);
    }


}