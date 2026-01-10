---
sidebar_position: 7
title: Trust Boundaries & Assumptions
---

# Trust Boundaries & Assumptions

QuantumAuth is designed around **explicit trust boundaries**.

Instead of assuming that browsers, applications, servers, or networks are secure, QuantumAuth clearly defines **what is trusted**, **what is not**, and **why**.  
Security guarantees depend on these boundaries being respected.

This document describes the **assumptions QuantumAuth makes** and the **components it intentionally does not trust**.

---

## Core Principle

> **QuantumAuth trusts hardware and cryptography — not software environments or networks.**

Security is derived from **device-bound cryptographic proof**, not from secrecy, perimeter controls, or user behavior.

---

## Trusted Components

The following components are **explicitly trusted**:

### 1. User-Owned Device Hardware
- The physical device under the user’s control
- Assumed not to be physically compromised at the hardware level

### 2. TPM (Trusted Platform Module)
- Enforces non-exportable key storage
- Performs cryptographic operations internally
- Prevents private key exfiltration

### 3. QuantumAuth Client (Local, Native)
- Runs outside the browser
- Interfaces directly with the TPM
- Performs all authentication and wallet signing operations
- Acts as the **sole authority** for signing and transaction submission

### 4. Cryptographic Primitives
- TPM-backed ECC
- Post-quantum signature algorithms
- Secure hashing (e.g., Argon2 for password derivation)

These primitives are assumed to be correctly implemented and cryptographically sound.

---

## Explicitly Untrusted Components

QuantumAuth is designed to remain secure even if the following are compromised:

### 1. Browsers
- Browser JavaScript
- DOM
- Extensions
- Injected scripts
- XSS or supply-chain attacks

Browsers are treated as **untrusted request surfaces**, never as key holders or signers.

---

### 2. dApps and Frontends
- First-party or third-party web applications
- UI logic
- Client-side SDKs

Frontends may be malicious, compromised, or intentionally deceptive.

---

### 3. Third-Party Backends
- Application servers
- Databases
- API layers
- Microservices

Backends are not trusted to store secrets or enforce identity securely.

---

### 4. Networks
- Local networks
- Internet
- Internal corporate networks
- Cloud networking layers

All network communication is assumed to be observable and tamperable.

---

### 5. QuantumAuth Server
- Treated as breachable by design
- Stores only public keys, metadata, and Argon2 hashes
- Never holds private keys or signing authority

A QuantumAuth Server compromise must **not** enable impersonation.

---

## Browser Trust Boundary (Critical)

QuantumAuth explicitly **excludes browsers from the trust boundary**.

As a result:
- Browsers never store private keys
- Browsers never generate signatures
- Browsers never submit blockchain transactions
- Browsers never hold reusable credentials

The browser’s only role is to **request actions** and display results.

---

## Transaction Authority Boundary

Only one component is authorized to sign and submit transactions:

> **The QuantumAuth Client**

Neither:
- dApps
- browsers
- extensions
- backends

are allowed to submit transactions or perform signing.

This eliminates entire classes of browser wallet attacks.

---

## Assumptions Required for Security Guarantees

QuantumAuth security guarantees hold **only if** the following assumptions are met:

1. The user device is not physically compromised at the hardware level
2. The TPM is functioning correctly and not backdoored
3. The operating system is not compromised at the kernel or firmware level
4. The QuantumAuth Client is installed and running correctly
5. The user maintains control of their device credentials

These assumptions are consistent with modern secure hardware models and are **strictly weaker** than those required by password- or token-based systems.

---

## What QuantumAuth Does NOT Assume

QuantumAuth does **not** assume:

- That users behave securely
- That passwords remain secret
- That browsers are trustworthy
- That servers remain uncompromised
- That networks are private
- That tokens cannot be stolen
- That secrets can be safely stored long-term

This is intentional.

---

## Implications for Audits & Compliance

Because trust boundaries are explicit:

- Authentication logic can be isolated and audited
- Applications never handle secrets
- Key custody is centralized in hardware
- Server breaches have limited blast radius
- Identity guarantees are formally provable

This design aligns naturally with:
- SOC 2 (least privilege, separation of duties)
- ISO 27001 (asset classification, risk reduction)
- NIST Zero Trust principles

A dedicated compliance section follows.

---

## Summary

QuantumAuth draws hard lines around trust.

- **Hardware is trusted**
- **Cryptography is trusted**
- **Everything else is assumed hostile**

By enforcing these boundaries, QuantumAuth achieves security properties that are not possible in browser-, token-, or password-based authentication systems.
