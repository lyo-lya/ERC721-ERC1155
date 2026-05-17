const { ethers } = require("hardhat");

async function main() {

    const baseURI =
        "ipfs://bafybeiguc6d7alixk7oaeumpg7haqi6pl7vtezovworxmt7gtum23ajekm/{id}.json";

    const Contract = await ethers.getContractFactory(
        "GameCharacterCollectionERC1155"
    );

    const contract = await Contract.deploy(baseURI);

    await contract.deployed();

    console.log("ERC1155 deployed:", contract.address);
}

main();