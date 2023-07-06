// SPDX-License-Indentifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

contract DeploySimpleStorage is Script {
    function run() external returns (SimpleStorage) {
        vm.startBroadcast();
// any transaction that we want to send we need to pu that between startBroadcast and stopBroadcast
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage;
    }
}