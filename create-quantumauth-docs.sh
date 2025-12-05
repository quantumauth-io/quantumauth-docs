#!/usr/bin/env bash
set -e

mkdir -p docs/0-Introduction
mkdir -p docs/1-Getting-Started
mkdir -p docs/2-Concepts
mkdir -p docs/3-SDK/javascript
mkdir -p docs/3-SDK/go
mkdir -p docs/4-Server
mkdir -p docs/5-Client
mkdir -p docs/6-Integrations
mkdir -p docs/7-Deployment
mkdir -p docs/8-Reference
mkdir -p docs/9-Contributing

cat > docs/0-Introduction/what-is-quantumauth.md << 'F'
---
title: What is QuantumAuth?
---

# What is QuantumAuth?

TODO: Describe what QuantumAuth is, its goals and core value.
F

cat > docs/0-Introduction/how-it-works.md << 'F'
---
title: How QuantumAuth Works
---

# How QuantumAuth Works

TODO: High-level explanation of device-bound identity and the auth flow.
F

cat > docs/0-Introduction/architecture-overview.md << 'F'
---
title: Architecture Overview
---

# Architecture Overview

TODO: Diagram and explanation of server, client, SDK, and data flow.
F

cat > docs/1-Getting-Started/install-overview.md << 'F'
---
title: Install Overview
---

# Install Overview

TODO: Overview of installing the server, client, and SDK.
F

cat > docs/1-Getting-Started/setup-server.md << 'F'
---
title: Setup Server
---

# Setup Server

TODO: Steps to run the QuantumAuth server locally and in dev.
F

cat > docs/1-Getting-Started/setup-client.md << 'F'
---
title: Setup Client
---

# Setup Client

TODO: Steps to run the local QuantumAuth client on the user's machine.
F

cat > docs/1-Getting-Started/first-login-flow.md << 'F'
---
title: First Login Flow
---

# First Login Flow

TODO: Walkthrough of registering a user, device, and performing first login.
F

cat > docs/1-Getting-Started/troubleshooting.md << 'F'
---
title: Troubleshooting
---

# Troubleshooting

TODO: Common issues (TPM access, network, config) and fixes.
F

cat > docs/2-Concepts/device-bound-identity.md << 'F'
---
title: Device-Bound Identity
---

# Device-Bound Identity

TODO: Concept of binding identity to a physical device via keys.
F

cat > docs/2-Concepts/challenge-response.md << 'F'
---
title: Challenge-Response
---

# Challenge-Response

TODO: Explain challenge generation, signing, and verification.
F

cat > docs/2-Concepts/tpm-explained.md << 'F'
---
title: TPM Explained
---

# TPM Explained

TODO: What a TPM is and how QuantumAuth uses it.
F

cat > docs/2-Concepts/attestation.md << 'F'
---
title: Attestation
---

# Attestation

TODO: Device attestation concepts and future plans.
F

cat > docs/2-Concepts/device-linking.md << 'F'
---
title: Device Linking
---

# Device Linking

TODO: Multi-device support and linking flows.
F

cat > docs/2-Concepts/security-model.md << 'F'
---
title: Security Model
---

# Security Model

TODO: Security assumptions, guarantees, and invariants.
F

cat > docs/2-Concepts/threat-model.md << 'F'
---
title: Threat Model
---

# Threat Model

TODO: Attacker capabilities and how QuantumAuth defends.
F

cat > docs/3-SDK/javascript/install.md << 'F'
---
title: JavaScript/TypeScript SDK - Install
---

# JavaScript / TypeScript SDK - Install

TODO: npm/pnpm/yarn install commands and basic setup.
F

cat > docs/3-SDK/javascript/usage.md << 'F'
---
title: JavaScript/TypeScript SDK - Usage
---

# JavaScript / TypeScript SDK - Usage

TODO: How to use the SDK in a web/Next.js app.
F

cat > docs/3-SDK/javascript/examples.md << 'F'
---
title: JavaScript/TypeScript SDK - Examples
---

# JavaScript / TypeScript SDK - Examples

TODO: Code samples (login, logout, device registration).
F

cat > docs/3-SDK/go/server-setup.md << 'F'
---
title: Go SDK - Server Setup
---

# Go SDK - Server Setup

TODO: How to integrate QuantumAuth server logic in Go.
F

cat > docs/3-SDK/go/handlers.md << 'F'
---
title: Go SDK - Handlers
---

# Go SDK - Handlers

TODO: Example HTTP handlers for challenge and verify endpoints.
F

cat > docs/3-SDK/go/verifying-signatures.md << 'F'
---
title: Go SDK - Verifying Signatures
---

# Go SDK - Verifying Signatures

TODO: How to verify client signatures on the server in Go.
F

cat > docs/3-SDK/api-reference.md << 'F'
---
title: SDK API Reference
---

# SDK API Reference

TODO: High-level API reference linking to language-specific docs.
F

cat > docs/4-Server/routes.md << 'F'
---
title: Server Routes
---

# Server Routes

TODO: List and describe server endpoints (users, devices, auth).
F

cat > docs/4-Server/database.md << 'F'
---
title: Database
---

# Database

TODO: Schema, migrations, indexes, and storage concerns.
F

cat > docs/4-Server/configuration.md << 'F'
---
title: Configuration
---

# Configuration

TODO: Config file/env vars for tuning the server.
F

cat > docs/4-Server/environment-variables.md << 'F'
---
title: Environment Variables
---

# Environment Variables

TODO: Document all important env vars for server and client.
F

cat > docs/4-Server/scaling.md << 'F'
---
title: Scaling
---

# Scaling

TODO: Running QuantumAuth at scale (workers, load balancers, DB).
F

cat > docs/5-Client/architecture.md << 'F'
---
title: Client Architecture
---

# Client Architecture

TODO: How the local client is structured and how it talks to the server.
F

cat > docs/5-Client/tpm-key-storage.md << 'F'
---
title: TPM Key Storage
---

# TPM Key Storage

TODO: How keys are created, stored, and accessed in TPM.
F

cat > docs/5-Client/keypair-lifecycle.md << 'F'
---
title: Keypair Lifecycle
---

# Keypair Lifecycle

TODO: Creation, rotation, revocation, and migration of device keys.
F

cat > docs/5-Client/security-sandboxing.md << 'F'
---
title: Security & Sandboxing
---

# Security & Sandboxing

TODO: How the client isolates secrets and protects operations.
F

cat > docs/6-Integrations/nextjs.md << 'F'
---
title: Next.js Integration
---

# Next.js Integration

TODO: How to integrate QuantumAuth into a Next.js app.
F

cat > docs/6-Integrations/react-native.md << 'F'
---
title: React Native Integration
---

# React Native Integration

TODO: Mobile integration patterns (planned).
F

cat > docs/6-Integrations/linux-desktop.md << 'F'
---
title: Linux Desktop Integration
---

# Linux Desktop Integration

TODO: Using QuantumAuth with Linux desktop apps.
F

cat > docs/6-Integrations/windows.md << 'F'
---
title: Windows Integration
---

# Windows Integration

TODO: Using QuantumAuth with Windows apps (TPM, etc.).
F

cat > docs/6-Integrations/macos.md << 'F'
---
title: macOS Integration
---

# macOS Integration

TODO: Using QuantumAuth with macOS (Secure Enclave planned).
F

cat > docs/6-Integrations/iot.md << 'F'
---
title: IoT Integration
---

# IoT Integration

TODO: Using QuantumAuth for embedded/IoT devices.
F

cat > docs/6-Integrations/oauth-adapter.md << 'F'
---
title: OAuth Adapter
---

# OAuth Adapter

TODO: Using QuantumAuth as a backend for OAuth/OIDC.
F

cat > docs/7-Deployment/docker.md << 'F'
---
title: Docker Deployment
---

# Docker Deployment

TODO: Docker images and compose examples.
F

cat > docs/7-Deployment/kubernetes.md << 'F'
---
title: Kubernetes Deployment
---

# Kubernetes Deployment

TODO: K8s manifests/Helm charts and best practices.
F

cat > docs/7-Deployment/reverse-proxy.md << 'F'
---
title: Reverse Proxy
---

# Reverse Proxy

TODO: Nginx/Traefik/Caddy configs for QuantumAuth.
F

cat > docs/7-Deployment/production-checklist.md << 'F'
---
title: Production Checklist
---

# Production Checklist

TODO: Pre-launch checklist (TLS, logging, backups, monitoring).
F

cat > docs/8-Reference/protocol-spec.md << 'F'
---
title: Protocol Spec
---

# Protocol Spec

TODO: Formal description of QuantumAuth protocol.
F

cat > docs/8-Reference/signing-algorithms.md << 'F'
---
title: Signing Algorithms
---

# Signing Algorithms

TODO: Which curves/algorithms are supported and why.
F

cat > docs/8-Reference/error-codes.md << 'F'
---
title: Error Codes
---

# Error Codes

TODO: List of server/client error codes and meanings.
F

cat > docs/8-Reference/glossary.md << 'F'
---
title: Glossary
---

# Glossary

TODO: Terms and definitions used across the docs.
F

cat > docs/9-Contributing/contributing.md << 'F'
---
title: Contributing
---

# Contributing

TODO: How to contribute, PR guidelines, issues, etc.
F

cat > docs/9-Contributing/code-style.md << 'F'
---
title: Code Style
---

# Code Style

TODO: Style rules for Go, TS, docs, and commit messages.
F

cat > docs/9-Contributing/roadmap.md << 'F'
---
title: Roadmap
---

# Roadmap

TODO: Planned features and long-term direction for QuantumAuth.
F

echo "All QuantumAuth doc stubs created."
