// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract ManualToken {
    string public name = "0xError";
    mapping(address => uint256) private s_balances;

    function decimals() public view returns (uint8) {
        return 18;
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        s_balances[_owner];
    }

    function transfer(address _to, uint256 _value) public {
        uint256 prevBalances = balanceOf(msg.sender) + balanceOf(_to);
        s_balances[msg.sender] -= _value;
        s_balances[_to] += _value;
        require(balanceOf(msg.sender) + balanceOf(_to) == prevBalances);
    }
}
