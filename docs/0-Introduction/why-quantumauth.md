---
sidebar_position: 4
title: Why QuantumAuth?
---

# Why QuantumAuth?

QuantumAuth is an **open-source**, hardware-anchored authentication layer that eliminates passwords, bearer tokens, refresh tokens, and user-managed keys.  
It binds identity to **TPM hardware**, a **post-quantum signature layer**, and a **device-local daemon**, ensuring that no third-party platform ever stores credentials that can be reused or stolen.

QuantumAuth delivers:

- **No single point of failure**
- **Credential-less authentication** for third-party platforms
- **Hardware-bound identity** (TPM keys cannot be exported)
- **Post-quantum security** through additional signature layers
- **Attack resistance** even if the QuantumAuth server or a third-party backend is fully compromised

---

## 1. Device Enrollment (One-Time Setup)

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant Device as User device
    participant QAClient as qa-client (daemon)
    participant TPM as TPM hardware key
    participant PQ as PQ key pair
    participant QAServer as QuantumAuth Server

    User->>Device: Install qa-client
    Device->>QAClient: Start first-time setup

    QAClient->>TPM: Create TPM key pair (device-bound)
    TPM-->>QAClient: TPM public key

    QAClient->>PQ: Create PQ key pair (post-quantum)
    PQ-->>QAClient: PQ public key

    User->>QAClient: Choose qa-client password
    QAClient->>QAServer: Send TPM pubkey, PQ pubkey, password

    QAServer->>QAServer: Hash password with Argon2
    QAServer->>QAServer: Store (TPM pubkey, PQ pubkey, Argon2 hash)

    note over QAServer: Even if server is compromised,<br/>only public keys + Argon2 hashes leak.<br/>No reusable credentials exist.
```

---

## 2. Transparent Authentication Workflow

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant Browser as Client browser (qaSDK)
    participant QAClient as qa-client (local daemon)
    participant TPM as TPM hardware key
    participant PQ as PQ signer
    participant QAServer as QuantumAuth Server
    participant ThirdPartyA as Third-party Backend A
    participant ThirdPartyB as Third-party Backend B

    User->>Browser: Open app.example.com
    Browser->>QAClient: Request authentication (via qaSDK)

    QAClient->>QAServer: Request unique challenge
    QAServer-->>QAClient: Return one-time challenge

    QAClient->>TPM: Sign challenge + request context
    TPM-->>QAClient: TPM signature
    QAClient->>PQ: PQ signature over TPM payload
    PQ-->>QAClient: PQ signature
    QAClient-->>Browser: Return signed bundle

    Browser->>ThirdPartyA: Auth request + QA bundle
    ThirdPartyA->>QAServer: Verify signatures + consume challenge
    QAServer-->>ThirdPartyA: Authenticated user ID

    par Another platform
        Browser->>ThirdPartyB: Auth request + bundle
        ThirdPartyB->>QAServer: Verify signatures
        QAServer-->>ThirdPartyB: Authenticated user ID
    end
```

### Guarantees

- No single point of failure  
- No credentials stored on third-party systems  
- TPM private keys cannot be exported  
- PQ signatures add a post-quantum layer  

To compromise one account, an attacker must have:

- Physical access to the device  
- OS/device credentials  
- The qa-client password  
- Ability to send requests from that device  

---

## 3. Comparison With Classic Authentication

### JWT Authentication

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant Browser as Browser
    participant Backend as App Backend
    participant DB as Database

    User->>Browser: Submit email/password
    Browser->>Backend: POST /login
    Backend->>DB: Verify password
    Backend->>Backend: Sign JWT
    Backend-->>Browser: Return access token

    Browser->>Backend: Use JWT as bearer token

    note over Backend: If JWT secret leaks,<br/>attacker can forge tokens for any user.
```

---

### Session-Based Authentication

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant Browser
    participant Backend
    participant Store as Session Store

    User->>Backend: Login
    Backend->>Store: Create session
    Backend-->>Browser: Set-Cookie: session_id

    Browser->>Backend: Send session cookie
    Backend->>Store: Validate session

    note over Store: If session store or key leaks,<br/>attacker can hijack sessions.
```

---

### SSH Key Authentication

```mermaid
sequenceDiagram
    autonumber
    actor User
    participant Client as SSH Client
    participant KeyStore as Local Private Key
    participant Server as SSH Server

    User->>Client: ssh user@server
    Client->>KeyStore: Sign challenge
    Client->>Server: Provide signature
    Server->>Server: Verify signature

    note over KeyStore: Private key can be copied or stolen.
```

---

## 4. Why QuantumAuth is Different

Traditional authentication mechanisms rely on **shared secrets, tokens, or user-managed private keys**.  
QuantumAuth replaces all of these with:

### ✔ Hardware-bound identity  
TPM keys never leave the device.

### ✔ Post-quantum layered signatures  
Break one layer, still can't impersonate.

### ✔ Zero credentials stored on third-party platforms  
Nothing to steal, dump, or leak.

### ✔ Server compromise is not enough  
Public keys + Argon2 hashes are useless without the real device.

QuantumAuth shifts authentication from:

> **“Whoever has the token wins”**  
to  
> **“Only the legitimate device + user can ever produce a valid signature.”**

---

