require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
    solidity: "0.8.24",
    networks: {
        op_sepolia: {
            url: process.env.OP_SEPOLIA_RPC_URL,
            accounts: [
                process.env.PRIVATE_KEY_1/*,
                process.env.PRIVATE_KEY_2*/
            ],
        },
    },
};