pragma solidity >=0.5.0;


contract Latam{
    string public name = "Latam Token";
    string public symbol = "LTM";
    uint256 public totalSupply = 1000000;
    uint8 public decimals = 2;

    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value
    );

    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint _value
    );

    mapping(address => uint256) public balanceOf;
        mapping(address => mapping(address => uint256)) public allowance;

    constructor () {
        balanceOf[msg.sender] = totalSupply;
    }

    function aprove(address _spender, uint _value) public returns (bool success){
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
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
        require(_value <= balanceOf[_from]);
        require(_value >= allowance[_from][msg.sender]);
        balanceOf[_to]+= _value;
        balanceOf[_from] -= _value;
        allowance[msg.sender][_from] -= _value;
        emit Transfer(_from, _to, _value);
        return true;
    }
}