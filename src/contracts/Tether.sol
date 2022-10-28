pragma solidity >=0.5.0;

contract Tether {
    string public name= 'Theter';
    string public symbol= 'USDT';
    uint256 public totalSupply = 1000000000000000000; // 1 millon
    uint8 public decimals= 18;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value
    );

    event Approve(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );

    mapping(address => uint256) public balanceOf;

    constructor () {
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint _value) public returns(bool success) {
        //Ve si el valor del sender es mayor a la cantidad a transferir,
        // resta el valor al balance del sender y lo suma al balance del que recibe.
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
       emit Transfer(msg.sender, _to, _value);
       return true;
    }

    function transerFrom(address _from, address _to, uint256 _value) public returns(bool succes){
        balanceOf[_to]+= _value;
        balanceOf[_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}