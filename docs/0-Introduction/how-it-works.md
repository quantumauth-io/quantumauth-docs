---
sidebar_position: 2
title: How QuantumAuth Works
---

QuantumAuth replaces traditional authentication and wallet models with **device-bound identity rooted in secure hardware**.

Users authenticate **once** on their own device using the QuantumAuth Client.  
After that, applications and Web3 dApps can securely authenticate users and authorize actions **without passwords, tokens, browser wallets, or seed phrases**.

Authentication and signing become invisible.

---

## High-Level Flow

QuantumAuth is built around three components:

1. **QuantumAuth Client (local, trusted)**
2. **QuantumAuth Browser Extension (bridge, no keys)**
3. **QuantumAuth Server + SDK (verification layer)**

All cryptographic operations happen **on the user’s device**, never in the browser or the application.

---

## Device-Bound Identity

QuantumAuth anchors identity directly to the device:

- A **TPM-backed keypair** is generated locally
- The private key is **sealed inside the TPM**
- The key cannot be copied, exported, or exfiltrated
- All authentication and signing operations happen locally

The QuantumAuth Server stores only the **public key** and device metadata.

This creates a **hardware-rooted identity** that cannot be phished or reused elsewhere.

Because identity is device-bound:

- No passwords are needed
- No secrets live in apps or browsers
- No tokens are issued or refreshed
- Replay attacks are prevented by challenge signing

---

## One-Time Local Login

Users authenticate **once** via the QuantumAuth Client.

After this initial setup:

- The device is trusted by QuantumAuth
- The Client can sign authentication and wallet requests
- Applications never see credentials or keys

There is no per-app login flow.

---

## Authentication Flow (Apps & APIs)

When an application needs to authenticate a user action:

### 1. The frontend requests authentication from the local client

```
GET http://localhost:8090/qa/authenticate
```

The QuantumAuth Client returns:

- A TPM-signed challenge
- A post-quantum signature
- Canonical request metadata

---

### 2. The frontend forwards the proof to its backend

```
POST /api/action
Authorization: QuantumAuth ...
X-QuantumAuth-Canonical-B64: ...
```

---

### 3. The backend validates via the QuantumAuth SDK

The SDK middleware:
- Extracts the proof
- Canonicalizes the request
- Forwards everything to the QuantumAuth Server

---

### 4. The QuantumAuth Server verifies the request

The server validates:

- TPM signature (hardware-rooted identity)
- Post-quantum signature
- One-time challenge (freshness / replay protection)
- Device ↔ user binding

If valid, it returns:

```json
{
  "userId": "024e6efd-471d-4848-8fba-0d2ad74e2b68"
}
```

---

### 5. The backend proceeds as authenticated

No sessions.  
No tokens.  
No password checks.

---

## Wallet Architecture (No Browser Wallet)

QuantumAuth includes a **hardware-secured wallet** that follows the same model:

- Wallet keys are **TPM-sealed**
- No seed phrases
- No private keys in browser memory
- No wallet managing secrets in JavaScript

All signing happens inside the QuantumAuth Client.

---

## The Browser Extension (Secure Bridge)

The QuantumAuth browser extension is **not a wallet**.

It does **not**:
- Store keys
- Generate signatures
- Hold secrets

Its role is strictly to:

- Bridge Web3 requests from the browser to the local QuantumAuth Client
- Enforce origin and request integrity
- Prevent direct access to cryptographic material

This removes the browser as a trust boundary.

---

## Web3 & Account Abstraction

QuantumAuth wallets are designed for **Account Abstraction (ERC-4337)**:

- Smart accounts with programmable security policies
- Hardware-backed signatures
- Multi-factor and recovery logic
- Policy-based execution for high-risk actions

QuantumAuth exposes a standard **EIP-1193 provider**, so existing dApps work without modification — while gaining significantly stronger security.

---

## What This Architecture Achieves

- Passwordless authentication
- Hardware-rooted identity
- Wallets without seed phrases
- No private keys in browsers
- Invisible auth UX
- Minimal integration for developers
- Strong guarantees against phishing and key theft