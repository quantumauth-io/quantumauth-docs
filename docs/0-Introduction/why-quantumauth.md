---
sidebar_position: 4
title: Why QuantumAuth
---

# Why QuantumAuth

QuantumAuth is a **hardware-rooted authentication and wallet platform** designed to eliminate passwords, tokens, sessions, seed phrases, and user-managed keys.

It replaces shared secrets and browser-based trust with **device-bound identity**, enforced by **TPM hardware**, **post-quantum signatures**, and **per-request cryptographic verification**.

QuantumAuth is built to remain secure even when applications, servers, or entire platforms are compromised.

---

## The Core Problem With Existing Authentication

Every mainstream authentication and wallet system relies on **reusable secrets**:

- Passwords
- JWTs and session cookies
- API keys and OAuth tokens
- SSH keys
- Browser wallet private keys
- Seed phrases

These secrets can be **stolen, phished, leaked, replayed, or forged** — especially after a server or browser compromise.

> **Whoever has the token wins.**  
> This is the root flaw of modern authentication.

---

## The QuantumAuth Model

QuantumAuth removes shared secrets entirely and replaces them with:

- **Hardware-bound identity** (TPM keys are non-exportable)
- **Post-quantum layered signatures**
- **Per-request authentication** (no reusable credentials)
- **Local signing and transaction submission**
- **Zero trust in browsers or applications**

Identity is proven cryptographically, every time, by the real device.

---

## One-Time Device Enrollment

- A TPM-backed keypair is generated on the device
- A post-quantum keypair is created as a second layer
- Only **public keys** are registered with the QuantumAuth Server
- No passwords or secrets are ever shared with applications

Even if the QuantumAuth Server is compromised, attackers gain **only public keys and Argon2 hashes**, which are useless for impersonation.

---

## Per-Request Authentication (No Tokens)

QuantumAuth authenticates **every request**:

1. A fresh challenge is issued
2. The device signs using TPM hardware
3. A post-quantum signature is added
4. The server verifies and consumes the challenge

There are:
- No sessions
- No refresh tokens
- No bearer credentials
- Nothing to replay or steal

---

## Wallet Security Without Browser Wallets

QuantumAuth wallets:

- Use **TPM-sealed keys**
- Have **no seed phrases**
- Store **no private keys in the browser**
- Do **not allow dApps to submit transactions**

dApps only request actions.  
The **QuantumAuth Client signs and broadcasts transactions directly**, outside the browser trust boundary.

---

## Why This Is Fundamentally More Secure

QuantumAuth remains secure even if:

- A backend database is breached
- JWT secrets or session stores leak
- A browser or extension is compromised
- A phishing site perfectly imitates a real app

To impersonate a user, an attacker must have:
- Physical access to the device
- OS-level access
- The QuantumAuth Client credentials
- The ability to execute requests from that device

This is a radically higher bar than any existing system.

---

## What QuantumAuth Replaces

QuantumAuth removes the need for:

- Passwords and MFA prompts
- OAuth / OIDC flows
- JWTs and session cookies
- API keys and secret rotation
- Browser wallets and seed phrases
- Password managers and key files

For users, authentication becomes invisible.  
For developers, authentication disappears from application code.

---

## In One Sentence

**QuantumAuth is a hardware-rooted, post-quantum authentication and wallet system that removes passwords, tokens, browser wallets, and shared secrets by verifying every action directly from the user’s device.**