const { ethers } = require("hardhat");

async function main() {
    const Contract = await ethers.getContractFactory("SoulboundVisitCardERC721");

    const contract = await Contract.deploy();

    await contract.deployed();

    console.log("ERC721 deployed:", contract.address);
}

main();