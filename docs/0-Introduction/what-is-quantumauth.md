---
sidebar_position: 1
id: what-is-quantumauth
title: What is QuantumAuth?
sidebar_label: What is QuantumAuth?
slug: /0-Introduction/what-is-quantumauth
---

# What is QuantumAuth?

QuantumAuth is a **hardware-rooted, passwordless authentication and wallet platform** designed to eliminate passwords, login screens, browser-based wallets, and fragile identity flows.

Users authenticate **once on their own device**. From that moment on, applications can securely verify identity and authorize actions — **without handling credentials, secrets, tokens, or private keys**.

QuantumAuth shifts trust away from browsers and passwords and anchors it directly in **device hardware**.

---

## Core Idea: Device-Bound Identity

QuantumAuth binds identity to the user’s physical device:

- A cryptographic key is generated and **sealed inside the TPM**
- The private key **never leaves the hardware**
- All authentication and signing operations happen locally
- Nothing sensitive is exposed to apps, browsers, or websites

Identity is proven cryptographically, not through shared secrets.

---

## Invisible Authentication (Short Version)

Users authenticate **once** using the QuantumAuth Client.

After that:
- The device is trusted
- Authentication happens automatically
- Apps no longer need login flows
- No passwords, tokens, cookies, or OAuth logic

From the app’s perspective, authentication becomes a single verification call.

---

## A Secure Wallet — Without a Browser Wallet

QuantumAuth includes a **hardware-secured wallet** built on the same principles:

- Wallet keys are **TPM-sealed**
- No private keys in the browser
- No seed phrases to phish or leak
- No wallet extension managing secrets

Instead of a browser wallet, QuantumAuth uses a **native client + secure extension bridge**.

---

## The QuantumAuth Extension (Security Bridge)

The browser extension does **not** store keys and is **not a wallet**.

Its role:
- Acts as a secure bridge between the browser and the local QuantumAuth Client
- Forwards signing requests to the client
- Prevents direct key access from websites or browser memory

All cryptographic operations happen **outside the browser**, on the user’s machine.

---

## Account Abstraction (ERC-4337)

QuantumAuth wallets are designed for **Account Abstraction**:

- Smart accounts with programmable security policies
- Hardware-backed signatures
- Multi-factor and recovery logic
- Policy-based transaction approval

This enables:
- Stronger protection for high-value actions
- Governance-safe execution
- Institutional-grade security without degrading UX

---

## EIP-1193 Compatibility

QuantumAuth follows **EIP-1193** provider standards so it works with existing Web3 applications.

From a dApp’s perspective:
- QuantumAuth appears as a standard provider
- No custom wallet integration required
- No special-case logic

Under the hood, security is dramatically stronger.

---

## Why QuantumAuth Exists

Modern authentication and wallets fail because:

- Passwords get stolen
- Seed phrases get phished
- Browser wallets are high-risk
- OAuth and token systems are fragile
- Apps repeatedly re-implement auth incorrectly

QuantumAuth removes these failure modes by **removing secrets from apps and browsers entirely**.

---

## What QuantumAuth Enables

- Passwordless authentication
- Hardware-bound identity
- Wallets without seed phrases
- No private keys in the browser
- Secure Account Abstraction
- Invisible authentication for users
- Minimal integration for developers

---

## QuantumAuth in One Sentence

**QuantumAuth is a hardware-rooted authentication and wallet platform that removes passwords, browser wallets, and seed phrases by anchoring identity and signing directly in device hardware.**
