// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";

contract DigitalSignature {
    using ECDSA for bytes32;

    // Mapping to store used nonces to prevent replay attacks
    mapping(address => mapping(uint256 => bool)) public usedNonces;

    // Event emitted when a message is successfully signed
    event MessageSigned(address indexed signer, bytes32 messageHash);

    // Function to sign a message
    function signMessage(bytes32 messageHash, uint256 nonce) external {
        require(!usedNonces[msg.sender][nonce], "Nonce already used");

        // Sign the message hash with the sender's private key
        bytes memory signature = messageHash.sign();

        // Mark the nonce as used
        usedNonces[msg.sender][nonce] = true;

        // Emit an event with the signer's address and the signed message hash
        emit MessageSigned(msg.sender, messageHash);
    }

    // Function to verify a message signature
    function verifySignature(
        address signer,
        bytes32 messageHash,
        bytes memory signature
    ) external pure returns (bool) {
        // Recover the address that signed the message from the signature
        address recoveredSigner = messageHash.recover(signature);

        // Check if the recovered address matches the expected signer
        return recoveredSigner == signer;
    }
}
