# From Zero to Kratos

---

## 🗂️ Agenda

- Why we chose Kratos
- My experience: integration with Java
- Kratos vs Keycloak/Auth0 (brief)
- Deployment overview
- Q&A

---

## Why we chose Kratos

In our project, we needed something:

- That we can fully control
- That doesn’t lock us into a vendor
- That we can run locally and scale later

I tried Auth0 — great docs but limited without $$$.
Tried Keycloak — too heavy, complex to theme, and opinionated.
Kratos felt like a good fit: it's just identity, not everything.

---

## What is Kratos?

- Open-source identity service
- Manages:
    - Registration / Login
    - Password recovery
    - Sessions (cookie or JWT)
- Headless: no UI, just flows via API

---

## Why Kratos is more than just Kratos

Kratos is part of the **Ory ecosystem**, and that’s where it gets fascinating:

- **Kratos** — Identity: users, sessions, recovery
- **Hydra** — OAuth2 & OpenID Connect provider
- **Oathkeeper** — API gateway with RBAC and JWT validation
- **Keto** — Google Zanzibar-style permission system (fine-grained auth)

🧩 You can plug Kratos into Spring Boot — but if your architecture grows, the rest of Ory is ready to support it.

> In our case, we used just Kratos, but the ecosystem gives confidence it can scale.

### What stood out in practice:

- API-first: everything is a REST call
- Flows make state explicit: login, registration, recovery — you track them via flow IDs
- Full control: want a CLI user signup? You can. Want a custom form from your React app? No problem.
- Built-in JSON schema validation for identities
- You can define traits like `email`, `role`, `verified`, and enforce them across all flows
- Works with browser sessions or JWTs — you choose the mode
- Has built-in support for:
    - Email verification and recovery
    - Webhooks on key actions (registration, login)
    - MFA (TOTP) via extensions

### For engineers, this means:

- No UI lock-in: build UX that fits your stack (React, Thymeleaf, JTE, mobile app — doesn't matter)
- No magic "black boxes" — each step of the user journey is exposed and manageable
- Debuggable: you can trace every decision via logs or API
- Secure by default: CSRF protection, hashed passwords, validated flows

Yes, Kratos requires effort.
But it gives you identity that **feels like infrastructure, not a hack**.

---

## Kratos vs Others

| Feature              | Kratos       | Keycloak | Auth0        |
|----------------------|--------------|----------|--------------|
| Open-source          | ✅            | ✅        | ❌ (limited)  |
| Self-hosted          | ✅            | ✅        | ⚠️ via proxy |
| Headless             | ✅            | ❌        | ❌            |
| UI Provided          | ❌            | ✅        | ✅            |
| Authorization Engine | ❌ (external) | ✅        | ✅            |

---

## Deployment (Short Version)

- Run with Docker (simple)
- Use PostgresSQL in prod (not SQLite)
- Helm chart available if you use K8s
- Secure Admin API behind VPN or gateway
- TLS via ingress (e.g. Traefik)

---

## Final Thoughts

- Kratos isn't magical. It's just clean and honest.
- Good for teams who want control, not magic.
- You’ll write more code, but you’ll understand it.

---

## 🙋 Q&A

_What else do you want to know?_

