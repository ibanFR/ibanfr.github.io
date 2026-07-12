---
title: Connecting Copilot with Jira using Atlassian Rovo MCP Server
date: 2026-04-11
header:
  overlay_image: /assets/images/posts/atlassian-mcp-overlay.png
  overlay_filter: 0.5
  show_overlay_excerpt: false
  teaser: /assets/images/posts/atlassian-mcp-teaser.png
categories:
  - AI
tags:
  - GitHub Copilot
  - Atlassian Rovo MCP Server
---

Connect GitHub Copilot with Jira using the Atlassian Rovo MCP Server to enable real-time interaction with Jira, Compass,
and Confluence data directly from your development environment.

This guide walks you through the setup and verification process.

For more details, see the official
guide: [Getting started with the Atlassian Rovo MCP Server](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/getting-started-with-the-atlassian-remote-mcp-server/).

## Atlassian Rovo MCP Server

The Atlassian Rovo MCP Server is Atlassian's official implementation of the Model Context Protocol (MCP) that connects
Atlassian's tools with your LLM, IDE, or agent platforms of choice.

See the [atlassian-mcp-server GitHub repository](https://github.com/atlassian/atlassian-mcp-server) for more details.

### Supported authentication methods

Atlassian Rovo MCP Server supports two authentication methods:

| Method    | Best for                                         | Header                                           |
|-----------|--------------------------------------------------|--------------------------------------------------|
| OAuth 2.1 | Interactive, user-driven tools                   | `Authorization: Bearer <access_token>`           |
| API token | Non-interactive and machine-to-machine scenarios | `Authorization: Basic <base64(email:api_token)>` |

### Authenticate via OAuth 2.1

OAuth 2.1 is the primary authentication mechanism for the Atlassian Rovo MCP Server. It uses an interactive consent flow
and preserves user context.

#### When to use OAuth 2.1

Use OAuth 2.1 when:

- A user is present and can complete the consent flow
- You want user-level consent and context
- You are using interactive apps or integrations

#### Steps to authenticate via OAuth 2.1

1. When prompted by your tool (e.g., Copilot CLI, Copilot Chat, or IDE plugin), select **Sign in with Atlassian**.
2. A browser window will open. Log in with your Atlassian account.
3. Review the requested permissions and grant access.
4. After consent, the tool completes authentication automatically.

For more details, see
the [Configuring OAuth 2.1](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/configuring-oauth-2-1/) guide
and
the [authentication and authorization](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/authentication-and-authorization/)
overview.

### Authenticate via API token

API token authentication is available only if your organization admin has enabled it.

#### When to use API token

Use API token authentication when:

- No user is present
- You need non-interactive, machine-to-machine access
- You can securely manage token storage, rotation, and audit

#### Enable API token authentication

1. Go to [Atlassian Administration](https://admin.atlassian.com/) and select your organization.
2. Select **Rovo** → **Rovo MCP server**.
3. Under **Authentication methods**, enable **API token**.

See
the [authentication configuration instructions](https://support.atlassian.com/security-and-access-policies/docs/control-atlassian-rovo-mcp-server-settings/#Configure-authentication).

#### Create an API token

1. Log in to your Atlassian account.
2. Select your profile icon → **Account settings** → **Security**.
3. Under **API tokens**, click **Create and manage API tokens**.
4. Click **Create API token with scopes**.
    - Give it a name (for example, "Copilot CLI") and select the expiry date.
    - Select the apps you'd like this API token to access (for example, Jira and Rovo MCP).
    - Select the scopes for the token (for example, `read:jira-user` and `read:jira-work`).
    - Create the token and copy it to a secure location.

For more details, see
the [Manage API tokens for your Atlassian account](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/)
guide.

## Configure GitHub Copilot IntelliJ plugin

1. Open **Settings** → **Tools** → **GitHub Copilot** → **Model Context Protocol**.
2. Under **Model Context Protocol**, select **Configure**.
3. Add a new MCP Server configuration with the following details:

   ```json
   {
     "servers": {
       "com.atlassian/atlassian-mcp-server": {
         "type": "http",
         "url": "https://mcp.atlassian.com/v1/mcp",
         "x-metadata": {
           "registry": {
             "api": {
               "baseUrl": "https://api.mcp.github.com",
               "version": "v0.1"
             },
             "mcpServer": {
               "name": "com.atlassian/atlassian-mcp-server",
               "version": "1.1.1"
             }
           }
         }
       }
     }
   }
   ```

Alternatively, install it from the MCP Server Registry:

1. Open GitHub Copilot Chat.
    - **View** → **Tool Windows** → **GitHub Copilot Chat**.
2. Click the **MCP Registry** icon in the top right corner.
3. Search for **Atlassian Rovo MCP Server** and click **Install**.

### Start the MCP Server

1. Open the Model Context Protocol server configuration file: `mcp.json`.
2. Click **Start** above the `com.atlassian/atlassian-mcp-server` server entry.

### Grant access

The Atlassian Rovo MCP Server uses OAuth 2.1 as its primary authentication mechanism, which requires you to grant access
to your Atlassian account.

1. When prompted, a browser window will open.
2. Grant access to your Jira site as instructed.

For more details,
see [Authentication and authorization](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/authentication-and-authorization/).

### Verify the connection

1. Open the GitHub Copilot MCP Log:
    - **View** → **Tool Windows** → **GitHub Copilot MCP Log**.
2. Select the server: `com.atlassian/atlassian-mcp-server`.
3. Confirm that the connection is successful and no errors are reported.

### Test the integration

To verify everything is working, try the following prompt in Copilot Chat:

```text
can you read the summary of this jira task <your-jira-task>
```

## Configure Copilot cloud agent

Copilot cloud agent uses **Agents** secrets and variables. For MCP servers, use a name that starts with `COPILOT_MCP_`
so the value is available to your MCP configuration.

### Configure secrets for Copilot cloud agent

1. [Create an API token](#create-an-api-token) in your Atlassian account with the necessary scopes (e.g.,
   `read:jira-user`,`read:jira-work`, etc.).
2. Base64‑encode the credentials:

    ```bash
    # Format: email:api_token
    echo -n "your.email@example.com:YOUR_API_TOKEN_HERE" | base64
   ```
3. On GitHub, navigate to the main page of your repository.
4. Click **Settings**.
5. In the **Security** section, click **Secrets and variables**, then click **Agents**.
6. Open the **Secrets** tab and click **New repository secret**.
7. Add a secret named `COPILOT_MCP_ATLASSIAN_API_KEY` with the Base64-encoded API token as the value.
8. Click **Add secret**.

For more details,
see [Create and manage secrets for GitHub Copilot cloud agent](https://docs.github.com/en/enterprise-cloud@latest/copilot/how-tos/copilot-on-github/customize-copilot/customize-cloud-agent/configure-secrets-and-variables).

### Add MCP Server configuration for Copilot cloud agent

1. On GitHub, navigate to your repository.
2. Go to **Settings** → **Copilot** → **Cloud agent**.
3. Under **Model Context Protocol (MCP)**, add a new MCP Server configuration with the following details:

```json
{
  "mcpServers": {
    "atlassian-rovo-mcp": {
      "command": "npx",
      "type": "local",
      "tools": [
        "*"
      ],
      "args": [
        "mcp-remote@latest",
        "https://mcp.atlassian.com/v1/mcp",
        "--header",
        "Authorization: Basic $ATLASSIAN_API_KEY"
      ],
      "env": {
        "ATLASSIAN_API_KEY": "$COPILOT_MCP_ATLASSIAN_API_KEY"
      }
    }
  }
}

```

See [Extending GitHub Copilot cloud agent with the Model Context Protocol (MCP)](https://docs.github.com/en/enterprise-cloud@latest/copilot/how-tos/use-copilot-agents/cloud-agent/extend-cloud-agent-with-mcp)

## Configure GitHub Copilot CLI

You need Copilot CLI installed before you can configure Atlassian MCP.

See the GitHub documentation for installation
instructions: [Install Copilot CLI](https://docs.github.com/en/copilot/how-tos/copilot-cli/set-up-copilot-cli/install-copilot-cli).

### Configure authentication with OAuth 2.1

1. Configure the MCP Server in the Copilot CLI configuration file (`~/.copilot/config.json`) with the following details:

    ```json
    {
      "mcpServers": {
        "atlassian-rovo-mcp": {
          "type": "http",
          "url": "https://mcp.atlassian.com/v1/mcp/authv2",
          "headers": {},
          "tools": [
            "*"
          ]
        }
      }
    }
    ```
2. When you run a Copilot CLI command that requires access to the MCP Server, you will be prompted to authenticate via
   OAuth 2.1.
3. Follow the instructions to complete the authentication flow.

### Configure authentication with an API token

1. [Create an API token](#create-an-api-token) in your Atlassian account with the necessary scopes (e.g.,
   `read:jira-user`,`read:jira-work`, etc.).
2. Base64‑encode the credentials:

    ```bash
    # Format: email:api_token
    echo -n "your.email@example.com:YOUR_API_TOKEN_HERE" | base64
   ```

3. Configure the MCP Server in the Copilot CLI configuration file (`~/.copilot/config.json`) with the following details:

    ```json
    {
      "mcpServers": {
        "atlassian-rovo-mcp": {
          "type": "http",
          "url": "https://mcp.atlassian.com/v1/mcp",
          "headers": {
            "Authorization": "Basic <base64(email:api_token)>"
          },
          "tools": [
            "*"
          ]
        }
      }
    }
    ```

For more details, see the official
documentation: [Configuring authentication via API token](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/configuring-authentication-via-api-token/).

## Update custom instructions for coding agents

Update your [AGENTS.md](https://agents.md/) with the Markdown below to reduce discovery tool calls, save time and
tokens, and set maximum search results.

```markdown

## Atlassian Rovo MCP

When connected to atlassian-rovo-mcp:

- **MUST** use Jira project key = YOURPROJ
- **MUST** use Confluence spaceId = "123456"
- **MUST** use cloudId = "https://yoursite.atlassian.net" (do NOT call getAccessibleAtlassianResources)
- **MUST** use `maxResults: 10` or `limit: 10` for ALL Jira JQL and Confluence CQL search operations.
```

See [Tips and tricks](https://github.com/atlassian/atlassian-mcp-server#tips-and-tricks) in the atlassian-mcp-server
documentation for more recommendations on optimizing your integration.

## mcp-atlassian

[mcp-atlassian](https://github.com/sooperset/mcp-atlassian) is an open-source MCP Server implementation for Atlassian
products, including Jira, Confluence, and Compass.

This project provides a reference implementation of an MCP Server that connects to Atlassian's APIs, enabling developers
to build their own integrations or use it as a starting point for their MCP Server development.

### Configuration

To configure the mcp-atlassian server, update the MCP configuration file (`mcp.json`) with the following details:

```json
{
  "mcpServers": {
    "mcp-atlassian": {
      "type": "stdio",
      "command": "uvx",
      "args": [
        "mcp-atlassian"
      ],
      "env": {
        "JIRA_URL": "https://yourjirasite.atlassian.net",
        "JIRA_USERNAME": "your.email@example.com",
        "JIRA_API_TOKEN": "{% raw %}${{ secrets.COPILOT_MCP_ATLASSIAN_API_TOKEN }}{% endraw %}"
      },
      "tools": [
        "*"
      ]
    }
  }
}
```

## Other resources

- [Guía práctica MCP: cómo conectar Atlassian con herramientas externas](https://blog.deiser.com/es/guia-practica-mcp-como-conectar-atlassian-con-herramientas-externas)
