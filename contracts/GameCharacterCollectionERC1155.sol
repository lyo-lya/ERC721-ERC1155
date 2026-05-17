// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract GameCharacterCollectionERC1155 is ERC1155, Ownable {

    constructor(string memory baseURI)
    ERC1155(baseURI)
    {}

    function mint(
        address to,
        uint256 id,
        uint256 amount
    ) public onlyOwner {
        _mint(to, id, amount, "");
    }

    function mintBatch(
        address to,
        uint256[] memory ids,
        uint256[] memory amounts
    ) public onlyOwner {
        _mintBatch(to, ids, amounts, "");
    }
}