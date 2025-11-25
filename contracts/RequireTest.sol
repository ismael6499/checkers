// SPDX-License-Identifier: GPL-3.0-only
pragma solidity 0.8.24; 

error TxOriginIsNotAdmin(address);

contract RequireTest {

    address admin;

    constructor(address admin_) {
        admin = admin_;
    }

    function checkAdminWithIf() public view{
        if(tx.origin != admin) revert();
    }

    function checkAdminWithRequire() public view{
        require(tx.origin == admin, "tx.origin must be admin"); //The error message can be a number code to save gas.
    }

    function checkAdminWithCustomError() public view{
        if(tx.origin != admin) revert TxOriginIsNotAdmin(tx.origin);
    }

}