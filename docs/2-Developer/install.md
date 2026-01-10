---
sidebar_position: 9
title: Installing QuantumAuth Client & Browser Extension
---

# Installing QuantumAuth Client & Browser Extension

This section explains how to install the **QuantumAuth Client** on Linux and Windows, and how to load the **QuantumAuth Browser Extension** manually while it is in pre-release.

The QuantumAuth Client is required for **all authentication and wallet operations**.  
The browser extension is a **secure bridge only** and does not contain keys or secrets.

---

## Installing the QuantumAuth Client

### Linux (Snap)

QuantumAuth is distributed on Linux as a **Snap package**.

#### Requirements
- Linux distribution with `snapd`
- TPM enabled in BIOS/UEFI

#### Install

```bash
sudo snap install quantumauth-client --classic
```

#### Verify installation

```bash
quantumauth-client version
```

#### Start the client

```bash
quantumauth-client start
```

On first start, the client will:
- Initialize TPM-backed keys
- Generate post-quantum keys
- Perform one-time device enrollment
- Create your wallet
- Deploy contract (optional)

The client exposes a local API (default):

```
http://localhost:6137
```

> The client must be running for authentication and wallet requests to succeed.

---

### Windows (Scoop)

QuantumAuth is distributed on Windows using **Scoop**.

#### Requirements
- Windows 10 or later
- TPM 2.0 enabled
- PowerShell

#### Install Scoop (if not already installed)

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
irm get.scoop.sh | iex
```

#### Install QuantumAuth Client

```powershell
scoop install quantumauth
```

#### Verify installation

```powershell
qa-client version
```

#### Start the client

```powershell
qa-client start
```

As on Linux, first start performs one-time device enrollment and key initialization.

---

## Installing the Browser Extension (Unpacked / Developer Mode)

The QuantumAuth browser extension is currently distributed as **unpacked source files**.

> The extension is **not a wallet**.  
> It does not store keys and cannot sign transactions.

Its only role is to forward requests between the browser and the local QuantumAuth Client.

---

### Chromium-Based Browsers (Chrome, Brave, Edge)

1. Open the Extensions page:
    - Chrome: `chrome://extensions`
    - Brave: `brave://extensions`
    - Edge: `edge://extensions`

2. Enable **Developer mode** (top-right toggle)

3. Click **Load unpacked**

4. Select the extension build directory:
   ```
   quantumauth-extension
   ```

5. Confirm the extension is loaded and enabled

The QuantumAuth extension icon should now appear in the browser toolbar.

---

### Firefox (Temporary Add-on)

1. Open:
   ```
   about:debugging#/runtime/this-firefox
   ```

2. Click **Load Temporary Add-on**

3. Select:
   ```
   quantumauth-extension/dist/manifest.json
   ```

4. Confirm the extension is loaded

> Note: Temporary add-ons must be reloaded after restarting Firefox.

---

## Verifying the Setup

Once installed:

- `qa-client` is running locally
- The browser extension is loaded
- A dApp or frontend can send EIP-1193 requests
- Requests are forwarded to the QuantumAuth Client
- All signing and transaction submission happens **outside the browser**

You can now proceed to:
- **Authentication Integration**
- **Wallet & Web3 Integration**

---

## Common Issues

### Client Not Running
- Ensure `qa-client start` is running
- Check that port `6137` is available

### TPM Not Detected
- Verify TPM is enabled in BIOS/UEFI
- On Linux, check with:
  ```bash
  tpm2_getcap properties-fixed
  ```

### Extension Not Connecting
- Confirm the extension build path is correct
- Ensure the client is running locally
- Check browser console logs

---

## Summary

- Install the QuantumAuth Client using Snap (Linux) or Scoop (Windows)
- Load the browser extension manually in developer mode
- No private keys or secrets ever enter the browser
- All cryptographic operations happen in the local client

Once installed, you are ready to integrate authentication and Web3 workflows securely.