---
sidebar_position: 6
title: Threat Model & Security Guarantees
---

# Threat Model & Security Guarantees

QuantumAuth is designed under the assumption that **systems will be compromised**.

Browsers, applications, servers, networks, and even cloud infrastructure are treated as **untrusted by default**.  
Security is derived from **device-bound cryptography**, not secrecy, perimeter defenses, or user behavior.

This document defines:
- The attacker model QuantumAuth is built against
- Explicit trust boundaries
- What QuantumAuth **guarantees**
- What is **out of scope by design**

---

## Design Philosophy

QuantumAuth follows three core principles:

1. **No shared secrets**
2. **No browser trust**
3. **No reusable credentials**

Every authenticated action must be proven cryptographically, by the real device, at the time of the request.

---

## Trust Boundaries

### Trusted
- User-owned device hardware
- TPM (Trusted Platform Module)
- QuantumAuth Client (native, local)
- Cryptographic primitives

### Explicitly NOT Trusted
- Browsers and browser JavaScript
- dApps and frontends
- Third-party backends
- Networks (LAN, WAN, internet)
- Cloud infrastructure
- QuantumAuth Server (treated as breachable)

---

## Attacker Model

QuantumAuth assumes attackers may have:

- Full control of a dApp frontend
- Full control of a third-party backend
- Database dumps (users, hashes, public keys)
- Network-level access (MITM, replay attempts)
- Phishing infrastructure
- Malicious browser extensions
- XSS or supply-chain attacks
- Stolen tokens, cookies, or API keys
- Read access to QuantumAuth Server storage

QuantumAuth remains secure under these conditions.

---

## Threats QuantumAuth Explicitly Prevents

### 1. Credential Theft & Replay

**Threat:**  
Passwords, tokens, cookies, API keys, or JWTs are stolen and reused.

**QuantumAuth Guarantee:**  
There are no reusable credentials.  
Every request is authenticated with a **fresh, one-time challenge** signed by the device.

✔️ No replay  
✔️ No token theft  
✔️ No bearer credentials

---

### 2. Phishing Attacks

**Threat:**  
Users are tricked into entering credentials or approving malicious prompts.

**QuantumAuth Guarantee:**  
Users never enter credentials, approve prompts, or sign arbitrary browser messages.

✔️ No login forms  
✔️ No approval popups  
✔️ Nothing for users to accidentally authorize

Phishing becomes ineffective because there is nothing to steal.

---

### 3. Browser Compromise

**Threat:**  
Malicious JavaScript, XSS, or a compromised extension attempts to steal keys or submit transactions.

**QuantumAuth Guarantee:**  
Browsers never hold private keys and never submit transactions.

✔️ No private keys in browser memory  
✔️ No signing in JavaScript  
✔️ No RPC access from the browser

The browser is reduced to a **request surface**, not a security boundary.

---

### 4. Server & Database Breaches

**Threat:**  
An attacker gains full access to backend servers or the QuantumAuth Server.

**QuantumAuth Guarantee:**  
Servers store only:
- Public keys
- Argon2 password hashes
- Metadata

✔️ No private keys  
✔️ No signing secrets  
✔️ No impersonation possible

A server breach does **not** allow attackers to authenticate as users.

---

### 5. Token Forgery & Session Hijacking

**Threat:**  
JWT secrets, session cookies, or OAuth tokens are forged or reused.

**QuantumAuth Guarantee:**  
QuantumAuth does not issue tokens or sessions.

✔️ No JWTs  
✔️ No refresh tokens  
✔️ No cookies  
✔️ No session stores

Authentication is stateless and per-request.

---

### 6. Wallet Key Exfiltration

**Threat:**  
Wallet private keys are copied, leaked, or extracted.

**QuantumAuth Guarantee:**  
Wallet keys are sealed inside the TPM and are **non-exportable**.

✔️ No seed phrases  
✔️ No private key files  
✔️ No browser key storage

Keys cannot be extracted even with OS-level access.

---

## Threats That Require Physical Compromise

To impersonate a QuantumAuth user, an attacker must have **all** of the following:

- Physical access to the device
- OS-level access
- QuantumAuth Client credentials
- Ability to execute requests locally on that device

This is a **much higher bar** than any password-, token-, or browser-based system.

---

## Threats Explicitly Out of Scope

QuantumAuth does **not** claim to protect against:

- Hardware backdoors in TPMs
- Nation-state physical device extraction
- User voluntarily handing over their unlocked device
- Compromised operating systems with kernel-level malware
- Malicious device firmware

These threats are outside the scope of any software-based authentication system.

---

## Security Guarantees Summary

QuantumAuth guarantees:

- **No shared secrets**
- **No reusable credentials**
- **No browser-based private keys**
- **Per-request cryptographic authentication**
- **Hardware-bound identity**
- **Survivability under server compromise**
- **Resistance to phishing and replay**
- **Elimination of entire attack classes**

---

## Key Security Invariant

> **Only the legitimate device can ever produce a valid QuantumAuth signature.**

Not a password.  
Not a token.  
Not a browser.  
Not a server.

The device itself is the identity.

---

## Final Note

QuantumAuth is designed for environments where breaches are assumed, not avoided.

Instead of trying to protect secrets forever, QuantumAuth removes secrets entirely and proves identity **every time**, directly from trusted hardware.

This is the foundation that makes QuantumAuth fundamentally different from all existing authentication and wallet systems.
