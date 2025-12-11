---
sidebar_position: 1
id: what-is-quantumauth
title: What is QuantumAuth?
sidebar_label: What is QuantumAuth?
slug: /0-Introduction/what-is-quantumauth
---

# What is QuantumAuth?

QuantumAuth is a **formless, passwordless, hardware‑rooted authentication platform** designed to eliminate the need for login screens, passwords, tokens, and traditional identity flows in modern applications.

Instead of requiring users to authenticate individually with each app, QuantumAuth lets users **log in once on their own device**, using the QuantumAuth Client. From that moment on, every application running on that device can authenticate the user automatically — without ever handling credentials.

QuantumAuth allows developers to completely remove:

- passwords
- login forms
- OAuth/OIDC complexity
- session management
- token storage or refresh logic
- secret handling

Applications simply rely on the QuantumAuth SDK, and the platform takes care of identity verification end‑to‑end.

---

## Core Concept: Hardware‑Bound Identity

QuantumAuth anchors identity in the user’s device hardware:

- A TPM-backed keypair is generated locally.
- The private key never leaves the TPM.
- The QuantumAuth Client signs authentication requests using:
    - **TPM signatures** (hardware identity)
    - **Post‑quantum signatures** (future‑proof cryptography)

The QuantumAuth Server verifies these signatures and ensures the request came from a valid user/device pair.  
No passwords. No secrets in transit. No credential storage.

---

## One-Time Device Login

Users authenticate **once** on their device using the QuantumAuth Client.

After that:

- The device becomes trusted by QuantumAuth.
- All apps on the device can authenticate through the Client.
- Authentication becomes invisible and frictionless.

There is no per-app login flow — the platform handles everything.

---

## How Apps Use QuantumAuth

Apps interact with QuantumAuth in two steps:

### 1. The frontend calls the QuantumAuth Client
It requests a signed authentication proof for the action the user is taking.

### 2. The backend verifies the proof via the QuantumAuth SDK
The SDK sends the proof to the QuantumAuth Server, which validates it and returns:

```json
{
  "authenticated": true,
  "userId": "USER-UUID-HERE"
}
```

The backend now knows the identity of the user — securely and without ever handling a password or token.

---

## Why QuantumAuth Exists

Modern authentication is fragile:

- Passwords get stolen.
- Tokens leak.
- OAuth/OIDC is too complex.
- Credential storage creates liability.
- Developers repeatedly implement authentication wrong.

QuantumAuth solves all of this by removing authentication from applications entirely.

### QuantumAuth’s goals:

- **Eliminate passwords**
- **Remove login flows from applications**
- **Make authentication invisible for users**
- **Provide cryptographically strong, device-bound identity**
- **Future-proof authentication with post-quantum security**
- **Give developers a simple, zero-config way to authenticate users**

---

## QuantumAuth in One Sentence

**QuantumAuth is a hardware-rooted, post-quantum authentication platform that lets users log in once on their device and eliminates passwords, tokens, and login screens for every app.**