// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

//vehicle NFT contract
contract VehicleNFT is ERC721 {
    //to set the contract address
    address contractAddress;
    // Counter for all the NFT token Ids
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;
    mapping(uint256 => string) private _tokenURIs;

    constructor(address mappingContract, string memory name, string memory symbol) ERC721(name, symbol) {
            contractAddress = mappingContract;
    }
    
    //setting the token uri based on token id
    function setTokenURI(uint256 tokenId, string memory _newURI) public {
        require(bytes(_tokenURIs[tokenId]).length == 0, "Cannot set uri twice");
        _tokenURIs[tokenId] = _newURI;
    }
    //minting function to safeky mint a new NFT
      function safeMint(address to, string memory _tokenURI) public
    {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        _safeMint(to,tokenId);
        setTokenURI(tokenId, _tokenURI);
    }
    //function to set token uri storage
    function tokenURI(uint256 _tokenId)
        public view override returns (string memory)
    {
        return _tokenURIs[_tokenId];
    }


}