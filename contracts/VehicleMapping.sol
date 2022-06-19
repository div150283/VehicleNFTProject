// SPDX-License-Identifier: Unlicensed
pragma solidity ^0.8.4;

import "hardhat/console.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/utils/ERC721Holder.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./VehicleNFT.sol";

//vehicle mapping contract
contract VehicleMapping is ReentrancyGuard,ERC721Holder {
    
    
     constructor() {
        console.log("This is the Vehicle Mapping Contract ^_^");
    }

    // car owner details
    struct OwnerAttributes {
        address ownerPublicKey;
        string ownerName;
        string ownerAddress;
    }
    //Car properties
    struct Car{
        string model;
        string color;
        uint256 year;
        string image;
        string chassisno;
    }


    // A mapping of owner id to tokenid
    mapping(address => uint256[]) private ownerIdToTokenId;

    // A mapping of tokenid to tokenurl
    mapping(uint256=>string)private tokenIdToTokenURL;

    //function to do the two mappings as defined above and pushing the values in the mappings
    function maptLicense(uint256 tokenid,string memory _tokenURI,address ownerid) public
    {
              
        ownerIdToTokenId[ownerid].push(tokenid) ;
        tokenIdToTokenURL[tokenid]=_tokenURI;

    }

}