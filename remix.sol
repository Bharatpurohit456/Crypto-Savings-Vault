// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SavingsVault {

    // Mapping to store the balance of each user
    mapping(address => uint256) public balances;

    // Deposit function to add ETH to the vault for the sender
    function deposit() external payable {
        require(msg.value > 0, "Must send some ETH");
        
        // Increase the balance of the sender
        balances[msg.sender] += msg.value;
    }

    // Withdraw function to allow users to withdraw ETH from their balance
    function withdraw(uint256 amount) external {
        require(amount <= balances[msg.sender], "Insufficient balance");
        
        // Decrease the sender's balance
        balances[msg.sender] -= amount;
        
        // Transfer the requested amount to the sender
        payable(msg.sender).transfer(amount);
    }

    // Get the balance of the caller (can also be used for other addresses)
    function getBalance() external view returns (uint256) {
        return balances[msg.sender];
    }
}
