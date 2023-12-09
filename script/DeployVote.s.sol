// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

import {Script} from "../lib/forge-std/src/Script.sol";
import {Vote} from "../src/Vote.sol";

contract Deploy is Script {
    function run() external returns (Vote) {
        vm.startBroadcast();
        Vote vote = new Vote();
        vm.stopBroadcast();
        return vote;
    }
}
