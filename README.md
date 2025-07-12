ERC20 Token Sale with Refund
This project implements a decentralized ERC20 token sale system with a built-in refund mechanism and admin testing utilities.

📋 Features
ERC20 token (MyToken) with controlled minting

Token sale contract:

Buy tokens with ETH at a fixed rate

Sell tokens back (refund) at the same rate

Ownership-controlled minting and withdrawal

Admin utility contract (GodMode) for quick testing of privileged actions

Deployment scripts (Hardhat with both ethers.js and web3.js)

Solidity tests

🛠️ Tech Stack
Solidity

Hardhat

TypeScript (deployment scripts)

Solidity tests

OpenZeppelin ERC20 library

📄 Contracts
Contract	Description
MyToken.sol	ERC20 token with owner-only minting
TokenSale.sol	Token sale with ETH-for-token and refund
GodMode.sol	Admin utility for testing privileged scenarios

🚀 Getting Started
Deploy & Test with Remix
1️⃣ Open Remix IDE

2️⃣ Clone or download this repository, and upload the contracts/ folder to Remix.

3️⃣ Compile the contracts:

In Remix, go to the Solidity Compiler tab.

Select the appropriate Solidity version (check pragma in the contracts).

Click Compile MyToken.sol, then Compile TokenSale.sol.

4️⃣ Deploy the contracts:

In the Deploy & Run Transactions tab:

First deploy MyToken.sol.

Then deploy TokenSale.sol, passing the MyToken contract address as a constructor argument.

5️⃣ Interact with the contracts:

Use the Remix UI to call the functions:

Mint tokens (owner only)

Buy tokens with ETH

Sell tokens back for ETH

Test admin utilities in GodMode.sol (optional)
