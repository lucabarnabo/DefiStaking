pragma solidity >=0.5.0;

import "./Latam.sol";
import "./Tether.sol";

contract DescentralBank {
    string public name = "DescentralBank";
    address public owner;
    Tether public tether;
    Latam public latam;

    constructor(Latam _latam, Tether _tether) public {
        latam = _latam;
        tether = _tether;
    }
}
