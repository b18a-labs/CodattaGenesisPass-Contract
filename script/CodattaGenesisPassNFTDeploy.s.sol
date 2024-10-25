// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Script, console} from "forge-std/Script.sol";
import "../src/CodattaGenesisPassNFT.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";

contract CodattaGenesisPassNFTDeploy is Script {

    function run() external {

        vm.startBroadcast();

        address OWNER_ADDRESS = 0xFc7CF39C030C391F4aC6638c367857DC18BbfE25;
        address SIGNER_ADDRESS = 0xFc7CF39C030C391F4aC6638c367857DC18BbfE25;

        address uupsProxy = Upgrades.deployUUPSProxy(
            "CodattaGenesisPassNFT.sol",
            abi.encodeCall(CodattaGenesisPassNFT.initialize, (OWNER_ADDRESS, SIGNER_ADDRESS))
        );

        console.log("uupsProxy deploy at %s", uupsProxy);

        vm.stopBroadcast();
    }
}