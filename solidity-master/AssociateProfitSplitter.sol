wpragma solidity ^0.5.0;

// lvl 1: equal split
contract AssociateProfitSplitter {
    // @TODO: Create three payable addresses representing `employee_one`, `employee_two` and `employee_three`.
    address public payable employee_one;
    address public payable employee_two;
    address public payable employee_three;

    constructor(address payable _one, address payable _two, address payable _three) public {
        employee_one = _one;
        employee_two = _two;
        employee_three = _three;
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    function deposit() public payable {
        // @TODO: Split `msg.value` into three
        uint amount = msg.value/3; // Your code here!

        // @TODO: Transfer the amount to each employee
        employee_one.transfer(amount);
        employee_two.transfer(amount);
        employee_three.transfer(amount);
        


        // @TODO: take care of a potential remainder by sending back to HR (`msg.sender`)
        //uint256 remainder = msg.value % 50000000000000000;
        //msg.sender.send(remainder);
        uint256 remainder = msg.value % 3;
        msg.sender.transfer(remainder);
    }

    function() external payable {
        // @TODO: Enforce that the `deposit` function is called in the fallback function!
        
        deposit();
        }
    }
