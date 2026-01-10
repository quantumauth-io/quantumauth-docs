---
sidebar_position: 10
title: Developer Quick Start (Auth)
---

# Developer Quick Start

This guide gets you from **zero to authenticated** with QuantumAuth in minutes.

By the end of this page, you will:
- Run the QuantumAuth Client locally
- Authenticate a backend request
- Avoid passwords, tokens, sessions, and OAuth entirely

This guide focuses on **authentication**. Wallet integration is covered in a later section.

---

## Prerequisites

Before you begin, ensure you have:

- A supported OS with TPM enabled
- The **QuantumAuth Client** installed
- A backend service you control (Node.js, Go, etc.)
- Basic HTTP knowledge

No OAuth provider, identity service, or database schema changes are required.

---

## Step 1: Install & Run the QuantumAuth Client

Install the QuantumAuth Client on your machine.

```bash
qa-client install
qa-client start
```

On first run, the client will:

- Initialize TPM-backed keys
- Generate post-quantum keys
- Perform one-time device enrollment

Once running, the client exposes a local API (default):

```
http://localhost:6137
```

> This service runs locally and is the **only component** allowed to perform authentication signing.

---

## Step 2: Authenticate a Request From the Frontend

From your frontend (web or native), request authentication through the local client using the QuantumAuth Web SDK.

### 1. Install the SDK

```bash
pnpm add @quantumauth/web
```

---

### 2. Import the Web Client utility

```ts
import { QuantumAuthWebClient } from "@quantumauth/web";
```

---

### 3. Configure the client

```ts
const qaClient = new QuantumAuthWebClient({
    backendBaseUrl: "http://localhost:4000", // your backend base URL
    appId: "optional-app-id",
});
```

---

### 4. Call a protected backend endpoint

```ts
async function callApiWithAuthentication() {
    try {
        const res = await qaClient.request<DemoResponse>({
            method: "POST",
            path: "/qa/demo",               // protected endpoint
            body: { ping: "hello world" },  // request payload
        });

        setQaResult(
            `status=${res.status} body=${JSON.stringify(res.data, null, 2)}`
        );
    } catch (err) {
        setQaResult("error: " + toErrorMessage(err));
    }
}
```

Behind the scenes, the Web SDK:

- Requests a signed authentication proof from the local QuantumAuth Client
- Attaches that proof to the outgoing backend request

The proof contains:

- A TPM-backed signature
- A post-quantum signature
- Canonical request metadata

You do **not** handle private keys, tokens, or secrets.

---

## Step 3: Verify With the QuantumAuth SDK (Backend)

Your backend verifies requests using the QuantumAuth Node SDK.

### 1. Install the SDK

```bash
pnpm add @quantumauth/node
```

Your backend does **not** need to understand the proof format.

---

### 2. Import the Node utilities

```ts
import {
    createExpressQuantumAuthMiddleware,
    QUANTUMAUTH_ALLOWED_HEADERS,
    QuantumAuthRequest,
} from "@quantumauth/node";
```

---

### 3. Configure CORS

QuantumAuth uses custom headers that must be explicitly allowed.

```ts
app.use(cors({
    origin: ["http://localhost:3000"], // frontend origin
    methods: ["GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"],
    allowedHeaders: [
        ...QUANTUMAUTH_ALLOWED_HEADERS,
    ],
    credentials: true,
}));
```

---

### 4. Create the middleware

```ts
const qaMiddleware = createExpressQuantumAuthMiddleware({
    backendApiKey: "dev-backend-key", // optional for development; treat as a secret in prod
});
```

---

### 5. Protect your authenticated routes

Apply the middleware to routes that require authentication.

```ts
app.post(
    "/qa/demo",
    qaMiddleware,
    (req: QuantumAuthRequest, res: Response) => {
        res.json({
            userId: req.userId, // authenticated QuantumAuth user ID (UUID)
            body: req.body,
        });
    }
);
```

The middleware:

- Extracts the QuantumAuth proof
- Canonicalizes the request
- Verifies it with the QuantumAuth Server
- Attaches the authenticated identity to the request context

---

## Step 4: Use the Authenticated Identity

Once verified, your backend receives:

- `userId` — a stable UUID representing the authenticated user

No sessions.  
No JWTs.  
No cookies.

Every request is independently authenticated.

---

## What You Did NOT Have to Do

- Create login forms
- Store passwords
- Manage sessions
- Rotate secrets
- Handle refresh tokens
- Implement OAuth flows

Authentication is now **infrastructure**, not application logic.

---

## Common Development Notes

- Authentication is **per-request**
- Proofs are **single-use**
- Replay attempts are rejected automatically
- Backend state is not required
- Horizontal scaling is trivial

---

## Summary

QuantumAuth allows developers to:

- Remove authentication code from applications
- Eliminate secret storage
- Gain hardware-rooted security by default

If you can make an HTTP request, you can integrate QuantumAuth.