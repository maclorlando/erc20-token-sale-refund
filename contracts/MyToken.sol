// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "module-1/contracts/TokenSale.sol";

contract MyToken is ERC20Capped(10**6) {

    address private owner;
    mapping(address=>bool) admins;
    address private tokenSaleContract;
    // The blacklist is used to block certain addresses from transferring tokens
    mapping(address => bool) private blacklist;

    constructor() ERC20("MyToken", "MTK") {
        owner = msg.sender;
    }

    function getOwner() public view returns(address){
        return owner;
    }

    function configTokenSaleContract(address _tokenSaleContract) external {
        require((tokenSaleContract == address(0)), "TokenSale Contract already configured.");
        tokenSaleContract = address(_tokenSaleContract);
    }

    function addAdmin(address _admin) external {
        require(msg.sender == owner || admins[msg.sender] || msg.sender == tokenSaleContract,"Unauthorized");
        admins[_admin] = true;
    }
    function removeAdmin(address _admin) external {
        require(msg.sender == owner || admins[msg.sender] || msg.sender == tokenSaleContract,"Unauthorized");
        admins[_admin] = false;
    }

    function mint(address recipient, uint256 amount) external {
        super._mint(recipient, amount);
    }

    function burn(address target, uint256 amount) external {
        super._burn(target, amount);
    }
    

    function isBlacklisted(address target) public view returns (bool) {
        return blacklist[target];
    }

    function addToBlacklist(address target) external {
        require(_msgSender() == owner, "Unauthorized");
        blacklist[target] = true; 
    }
    function removeFromBlacklist(address target) external {
        require(_msgSender() == owner, "Unauthorized");
        blacklist[target] = false; 
    }

    /**
     * @dev Transfers a `value` amount of tokens from `from` to `to`, or alternatively mints (or burns) if `from`
     * (or `to`) is the zero address. All customizations to transfers, mints, and burns should be done by overriding
     * this function.
     *
     * Emits a {Transfer} event.
     */
    function _update(address from, address to, uint256 value) override internal {
        require(!isBlacklisted(from) && !isBlacklisted(to), "Call is not authorized: blacklisted participants.");
        super._update(from, to, value);
    }

    function externalApprove(address _owner, address spender, uint256 value) external {
        require((msg.sender == owner || admins[msg.sender]), "Unauthorized - approval by owner or admin only.");
        super._approve(_owner, spender, value);
    }
}