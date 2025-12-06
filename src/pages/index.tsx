import React, {JSX} from "react";
import Layout from "@theme/Layout";
import Link from "@docusaurus/Link";
import styles from "./index.module.css";

function HomepageHeader() {
    return (
        <header className={styles.heroBanner}>
            <div className={styles.quantumBg}>
                <div className={`${styles.entangledPair} ${styles.pairLeft}`}>
                    <div className={styles.electron} />
                </div>
                <div className={`${styles.entangledPair} ${styles.pairRight}`}>
                    <div className={styles.electron} />
                </div>
                <div className={styles.entanglement} />
            </div>

            <div className={styles.heroContent}>
                <h1 className={styles.heroTitle}>QuantumAuth</h1>
                <p className={styles.heroSubtitle}>
                    Device-bound, quantum-inspired authentication.
                </p>
                <div className={styles.heroButtons}>
                    {/*<Link*/}
                    {/*    className={`${styles.buttonPrimary}`}*/}
                    {/*    to="/docs/0-Introduction/what-is-quantumauth?"*/}
                    {/*>*/}
                    {/*    Get started*/}
                    {/*</Link>*/}
                    <a
                        className={styles.buttonGhost}
                        href="https://github.com/quantumauth-io"
                        target="_blank"
                        rel="noopener noreferrer"
                    >
                        View on GitHub
                    </a>
                </div>
            </div>
        </header>
    );
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

export default function Home(): JSX.Element {
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
