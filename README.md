# 🛡️ Checkers: Error Handling & Gas Optimization

Part of my **Master in Blockchain Development** portfolio at **Blockchain Accelerator Academy**. This project focuses on a critical aspect of EVM development: **Efficient Error Handling**.

As a **Java Software Engineer**, I'm used to throwing detailed exceptions with long descriptive strings (`throw new IllegalArgumentException("...")`). In **Solidity**, however, storing and emitting those strings costs Gas. This project benchmarks the three main ways to handle validations to understand the trade-offs.

## 💡 Project Overview

The `RequireTest` contract demonstrates three distinct patterns for validating conditions (in this case, checking if the transaction origin is the admin):

1.  **The Classic Approach (`if + revert`):**
    * Uses a standard `if` statement followed by a `revert()` opcode. Simple, but offers no context on failure.
2.  **The Readable Approach (`require`):**
    * Uses `require(condition, "Error Message")`.
    * *Pros:* Very readable and concise.
    * *Cons:* The string "tx.origin must be admin" is stored in the contract bytecode and increases deployment and execution costs.
3.  **The Efficient Approach (`Custom Errors`):**
    * Uses the `error` definition `TxOriginIsNotAdmin(address)`.
    * *Pros:* Extremely gas-efficient. Instead of a string, it returns a 4-byte selector. It can also accept parameters to provide context without the overhead of strings.

## 🔍 Technical Takeaways

* **Solidity 0.8.4+ Feature:** Custom errors are the modern standard for smart contracts.
* **Gas Savings:** Replacing `require` strings with `Custom Errors` significantly reduces deployment size and runtime gas costs on revert.

## 🛠️ Stack & Tools

* **Language:** Solidity `^0.8.24`
* **Concepts:** `require`, `revert`, `Custom Errors`, Gas Optimization.
* **License:** GPL-3.0-only

---

*This project highlights the shift in mindset from "Detailed Logging" in Web2 to "Gas Efficiency" in Web3.*
