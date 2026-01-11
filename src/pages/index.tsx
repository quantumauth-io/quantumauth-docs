import React from "react";
import Layout from "@theme/Layout";
import styles from "./index.module.css";

function HomepageHeader() {
    return (
        <header className={styles.header}>
            <div className={styles.headerInner}>
                <div className={styles.headerCard}>
                    <img
                        className={styles.headerImage}
                        src="/img/og.png"
                        alt="QuantumAuth"
                        loading="eager"
                    />
                </div>
            </div>
        </header>
    )
}

function Feature({
                     title,
                     description,
                 }: {
    title: string;
    description: string;
}) {
    return (
        <div className={styles.feature}>
            <h3>{title}</h3>
            <p>{description}</p>
        </div>
    );
}

export default function Home(): React.JSX.Element {
    return (
        <Layout
            title="QuantumAuth"
            description="Device-bound, quantum-inspired authentication for modern applications."
        >
            <HomepageHeader />
            <main className={styles.main}>
                <section className={styles.featuresSection}>
                    <Feature
                        title="Device-bound identity"
                        description="Bind authentication to secure keys stored in the user's TPM or secure enclave. No passwords, no shared secrets over the network."
                    />
                    <Feature
                        title="Simple developer flow"
                        description="Request a challenge, sign locally, verify on the server. Small, composable building blocks that fit into your stack."
                    />
                    <Feature
                        title="Built for modern apps"
                        description="Go backend, local client, TypeScript SDK, and examples for web, desktop, and infrastructure integrations."
                    />
                </section>
            </main>
        </Layout>
    );
}
