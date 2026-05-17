// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SoulboundVisitCardERC721 is ERC721, Ownable {

    uint256 public nextTokenId;

    mapping(uint256 => string) private _tokenURIs;

    constructor() ERC721("StudentVisitCard", "SVC") {}

    function mint(address to, string memory metadataURI)
    public
    onlyOwner
    {
        uint256 tokenId = nextTokenId;

        _safeMint(to, tokenId);

        _tokenURIs[tokenId] = metadataURI;

        nextTokenId++;
    }

    function tokenURI(uint256 tokenId)
    public
    view
    override
    returns (string memory)
    {
        return _tokenURIs[tokenId];
    }

    // BLOCK TRANSFERS

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 tokenId,
        uint256 batchSize
    ) internal override {

        super._beforeTokenTransfer(from, to, tokenId, batchSize);

        if (from != address(0) && to != address(0)) {
            revert("Soulbound: transfers disabled");
        }
    }

    // DISABLE APPROVALS

    function approve(address, uint256) public pure override {
        revert("Soulbound: approvals disabled");
    }

    function setApprovalForAll(address, bool) public pure override {
        revert("Soulbound: approvals disabled");
    }
}

