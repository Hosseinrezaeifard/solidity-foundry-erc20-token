// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {ZXE} from "../src/ZXE.sol";
import {DeployZXE} from "../script/DeployZXE.s.sol";

contract ZXETest is Test {
    ZXE public zxe;
    DeployZXE public deployer;

    uint256 public constant STARTING_BALANCE =
        100 ether; /**  100 ether == 100 * 10**18 */

    address rick = makeAddr("rick");
    address morty = makeAddr("morty");

    function setUp() public {
        deployer = new DeployZXE();
        zxe = deployer.run();

        vm.prank(msg.sender);
        zxe.transfer(rick, STARTING_BALANCE);
    }

    function testRickBalance() public {
        assertEq(STARTING_BALANCE, zxe.balanceOf(rick));
    }
}
