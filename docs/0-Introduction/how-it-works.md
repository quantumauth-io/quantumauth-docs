---
title: How QuantumAuth Works
---

QuantumAuth replaces traditional login systems with **device-bound identity** rooted in secure hardware.  
Instead of entering usernames, passwords, tokens, or going through OAuth flows, users authenticate **once** on their device using the QuantumAuth Client. After this one-time login, *all applications running on that device* can authenticate the user automatically through the QuantumAuth platform.

There are no passwords, no login forms, and no tokens to manage.  
Authentication becomes invisible.

---

## Device-Bound Identity

QuantumAuth uses the device itself as the anchor of identity:

- A **TPM-backed keypair** is created on the user’s machine.
- The private key never leaves the TPM — it cannot be copied or exfiltrated.
- All authentication actions are **signed locally** on the user’s device.
- The QuantumAuth Server validates those signatures using the stored public key.

This creates a **cryptographically strong, hardware-rooted identity** unique to each user on each device.

Because the identity is bound to the machine:

- No passwords are needed
- No secrets are stored in applications
- No tokens need to be issued or refreshed
- Users cannot be phished

---

## One-Time Local Login

Users authenticate **only once** via the QuantumAuth Client.

After this:

- The device becomes "trusted" by QuantumAuth.
- Any app on the device can ask the Client to authenticate a request.
- The client signs requests using its TPM + post-quantum keys.

This login never touches the application—apps do not manage credentials.

---

## Invisible Authentication for Apps

When an app wants to authenticate a user action:

### 1. The frontend asks the QuantumAuth Client to authenticate the request

```
GET http://localhost:8090/qa/authenticate
```

The client returns:

- A TPM-signed proof
- A post-quantum signature
- Identity metadata

### 2. The frontend attaches this proof to its request to the backend

```
POST /api/action
Authorization: QuantumAuth ...
X-QuantumAuth-Canonical-B64 ...
```

### 3. The backend uses the QuantumAuth SDK to validate the request

The SDK middleware automatically forwards the proof to the QuantumAuth Server.

### 4. The QuantumAuth Server validates the hardware-bound identity

The third-party backend sends the canonical request and signatures to the QuantumAuth Server through the SDK middleware.

The server verifies:

- the TPM signature (device-rooted identity)
- the post-quantum signature
- the one-time challenge (freshness + replay protection)
- the device ↔ user binding

If everything is valid, the QuantumAuth Server returns the authenticated identity:

```json
{
  "authenticated": true,
  "userId": "024e6efd-471d-4848-8fba-0d2ad74e2b68"
}
```

### 5. The backend marks the request as authenticated

No tokens, no sessions, no password checks.
