// docusaurus.config.ts

import type {Config} from '@docusaurus/types';
import {themes as prismThemes} from 'prism-react-renderer';

const config: Config = {
    title: 'QuantumAuth',
    tagline: 'Device-bound, quantum-inspired authentication.',
    favicon: 'img/favicon.ico',

    url: 'https://quantumauth-io.github.io',
    baseUrl: '/quantumauth-docs/',
    organizationName: 'quantumauth-io',
    projectName: 'quantumauth-docs',

    trailingSlash: false,

    i18n: {
        defaultLocale: 'en',
        locales: ['en'],
    },

    presets: [
        [
            'classic',
            {
                docs: {
                    sidebarPath: './sidebars.ts',
                    routeBasePath: '/docs',
                    editUrl:
                        'https://github.com/quantumauth-io/quantumauth-docs/edit/main/',
                },

                blog: {
                    showReadingTime: true,
                    blogTitle: 'QuantumAuth Blog',
                    blogDescription: 'Updates, releases, security insights & engineering notes.',
                    postsPerPage: 10,

                    // 👇 enable "Edit this page" for blog posts too
                    editUrl: 'https://github.com/quantumauth-io/quantumauth-docs/edit/main/',
                },
                theme: {
                    customCss: './src/css/custom.css',
                },
            },
        ],
    ],

    themeConfig: {
        navbar: {
            title: 'QuantumAuth',
            logo: {
                alt: 'QuantumAuth logo',
                src: 'img/icon128.png', // add your logo here (or use favicon for now)
            },
            items: [
                {
                    type: 'docSidebar',
                    sidebarId: 'tutorialSidebar',
                    position: 'left',
                    label: 'Docs',
                },
                {
                    label: 'Blog',
                    to: '/blog',
                    position: 'left',
                },
                {
                    href: 'https://quantumauth-io.github.io/quantumauth-docs/docs/0-Introduction/what-is-quantumauth',
                    label: 'Getting started',
                    position: 'left',
                },
                {
                    href: 'https://github.com/quantumauth-io/quantum-auth',
                    label: 'Server',
                    position: 'right',
                },
                {
                    href: 'https://github.com/quantumauth-io/quantum-auth-client',
                    label: 'Client',
                    position: 'right',
                },
                {
                    href: 'https://github.com/quantumauth-io',
                    label: 'GitHub',
                    position: 'right',
                },
            ],
        },

        footer: {
            style: 'dark',
            links: [
                {
                    title: 'Docs',
                    items: [
                        {
                            label: 'Getting started',
                            to: '/docs/0-Introduction/what-is-quantumauth',
                        },
                    ],
                },
                {
                    title: 'Ecosystem',
                    items: [
                        {
                            label: 'QuantumAuth Server',
                            href: 'https://github.com/quantumauth-io/quantum-auth',
                        },
                        {
                            label: 'QuantumAuth Client',
                            href: 'https://github.com/quantumauth-io/quantum-auth-client',
                        },
                        {
                            label: 'QuantumAuth SDK',
                            href: 'https://github.com/quantumauth-io/quantum-auth-sdk',
                        },
                        {
                            label: 'Quantum Web (portal)',
                            href: 'https://github.com/quantumauth-io/quantum-web',
                        },
                    ],
                },
                {
                    title: 'Community',
                    items: [
                        {
                            label: 'GitHub Issues',
                            href: 'https://github.com/quantumauth-io/quantum-auth/issues',
                        },
                        {
                            label: 'Organization',
                            href: 'https://github.com/quantumauth-io',
                        },
                    ],
                },
            ],
            copyright: `© ${new Date().getFullYear()} QuantumAuth. Built with Docusaurus.`,
        },

        prism: {
            theme: prismThemes.dracula,
            darkTheme: prismThemes.dracula,
        },
    },
    markdown: {
        mermaid: true,
        hooks:{
            onBrokenMarkdownLinks: 'warn',
        }
    },
    themes: ['@docusaurus/theme-mermaid'],
};

export default config;
