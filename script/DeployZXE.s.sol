// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {ZXE} from "../src/ZXE.sol";
contract DeployZXE is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() external returns (ZXE) {
        vm.startBroadcast();
        ZXE zxeToken = new ZXE(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return zxeToken;
    }
}
