// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "./extensions/ERC721.sol";
import "./extensions/ERC721URIStorage.sol";
import "./access/Ownable.sol";
import "./utils/Counters.sol";


contract Saruto is ERC721, ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Saruto", "SRT") {}

    function _baseURI() internal pure override returns (string memory) {
        return "\"https://ipfs.io/ipfs/\"";
    }

    function safeMint(address to, string memory uri) public onlyOwner{
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) returns (string memory){
        return super.tokenURI(tokenId);
    }
}