{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": null,
   "metadata": {},
   "outputs": [],
   "source": [
    "pragma solidity ^0.5.0;\n",
    "\n",
    "// lvl 2: tiered split\n",
    "contract TieredProfitSplitter {\n",
    "    address payable employee_one; // ceo\n",
    "    address payable employee_two; // cto\n",
    "    address payable employee_three; // bob\n",
    "\n",
    "    constructor(address payable _one, address payable _two, address payable _three) public {\n",
    "        employee_one = _one;\n",
    "        employee_two = _two;\n",
    "        employee_three = _three;\n",
    "    }\n",
    "\n",
    "    // Should always return 0! Use this to test your `deposit` function's logic\n",
    "    function balance() public view returns(uint) {\n",
    "        return address(this).balance;\n",
    "    }\n",
    "\n",
    "    function deposit() public payable {\n",
    "        uint points = msg.value / 100; // Calculates rudimentary percentage by dividing msg.value into 100 units\n",
    "        uint total;\n",
    "        uint amount;\n",
    "\n",
    "        // @TODO: Calculate and transfer the distribution percentage\n",
    "        // Step 1: Set amount to equal `points` * the number of percentage points for this employee\n",
    "            amount = points * 60;\n",
    "        // Step 2: Add the `amount` to `total` to keep a running total\n",
    "            total = amount+total;\n",
    "        // Step 3: Transfer the `amount` to the employee\n",
    "            employee_one.transfer(amount);\n",
    "\n",
    "        // @TODO: Repeat the previous steps for `employee_two` and `employee_three`\n",
    "        // employee_two\n",
    "            amount = points * 25;\n",
    "            total = amount+total;\n",
    "            employee_two.transfer(amount);\n",
    "        \n",
    "        // employee_three\n",
    "        \n",
    "            amount = points * 15;\n",
    "            total = amount+total;\n",
    "            employee_three.transfer(amount);\n",
    "            \n",
    "        employee_one.transfer(msg.value - total); // ceo gets the remaining wei\n",
    "    }\n",
    "\n",
    "    function() external payable {\n",
    "        deposit();\n",
    "    }\n",
    "}\n"
   ]
  }
 ],
 "metadata": {
  "kernelspec": {
   "display_name": "Python 3",
   "language": "python",
   "name": "python3"
  },
  "language_info": {
   "codemirror_mode": {
    "name": "ipython",
    "version": 3
   },
   "file_extension": ".py",
   "mimetype": "text/x-python",
   "name": "python",
   "nbconvert_exporter": "python",
   "pygments_lexer": "ipython3",
   "version": "3.7.4"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 4
}
