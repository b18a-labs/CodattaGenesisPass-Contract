// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.26;

import {Test, console} from "forge-std/Test.sol";
import "../src/CodattaGenesisPassNFT.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";


contract CodattaGenesisPassNFTTest is Test {

    address constant OWNER_ADDRESS = 0xFc7CF39C030C391F4aC6638c367857DC18BbfE25;
    address constant SINGER_ADDRESS = 0xFc7CF39C030C391F4aC6638c367857DC18BbfE25;
    address constant USER1_ADDRESS = 0xd3fd9D84E3df663893aC4Eb0D3782b26B000e11A;

    address private proxy;
    CodattaGenesisPassNFT private instance;

    function setUp() public {

        console.log("start");
        proxy = Upgrades.deployUUPSProxy(
            "CodattaGenesisPassNFT.sol",
            abi.encodeCall(CodattaGenesisPassNFT.initialize, (OWNER_ADDRESS, SINGER_ADDRESS))
        );

        console.log("uups proxy -> %s", proxy);

        instance = CodattaGenesisPassNFT(proxy);
        assertEq(instance.owner(), OWNER_ADDRESS);

        address implAddressV1 = Upgrades.getImplementationAddress(proxy);

        console.log("impl -> %s", implAddressV1);

        vm.startPrank(OWNER_ADDRESS);
        console.log("setDefaultURI");
        instance.setDefaultURI("https://static.codatta.io/nft/genesis/metadata/");
        console.log("setSigner");
        instance.setSigner(SINGER_ADDRESS);
        vm.stopPrank();
    }

    function testMint() public {

        // vm.startPrank(OWNER_ADDRESS);
        // uint256 privateKey = vm.envUint("PRIVATE_KEY_DEPLOYER_TESTNET");
        // bytes32 digest = instance._computeDigest(OWNER_ADDRESS);
        // (uint8 _v, bytes32 _r, bytes32 _s) = vm.sign(privateKey, digest);
        // instance.mint(_r, _s, _v);
        // assertEq(instance.ownerOf(1), OWNER_ADDRESS);
        // assertEq(instance.currentTokenId(), 1);
        // vm.stopPrank();
        
    }
}