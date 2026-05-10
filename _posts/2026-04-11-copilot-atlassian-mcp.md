---
title: Connecting Copilot with Jira using Atlassian Rovo MCP Server
date: 2026-04-11
header:
  image: /assets/images/posts/atlassian-mcp.png
  teaser: /assets/images/posts/atlassian-mcp.png
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
Atlassian's tools with your LLM, IDE, or agent platforms of choice..

See the [atlassian-mcp-server GitHub repository](https://github.com/atlassian/atlassian-mcp-server) for more details.

### Allow tools to authenticate via API token

By default, users connect to the Atlassian Rovo MCP Server with OAuth 2.1. As an admin, you can enable API tokens to
handle non-active scenarios, where no users complete the consent flow.

1. Go to [Atlassian Administration](https://admin.atlassian.com/). Select your organization if you have more than one
2. Select **Rovo** → **Rovo MCP server**
3. Under **Authentication methods**, enable **API token**

See the [authentication configuration instructions](https://support.atlassian.com/security-and-access-policies/docs/control-atlassian-rovo-mcp-server-settings/#Configure-authentication).

### Create an API token

Authentication via API token lets MCP clients authenticate without an interactive OAuth consent screen.

1. Log in to your Atlassian account.
2. Select your profile icon → **Account settings** → **Security**.
3. Under **API tokens**, click **Create and manage API tokens**.
4. Click **Create API token with scopes**.
    - Give it a name (e.g., "Copilot CLI") and select the expiry date.
    - Select the apps you'd like this API token to access (e.g., Jira, Rovo MCP, etc.).
    - Select the Scopes for the token (e.g., `read:jira-user`, `read:jira-work`, etc.).
    - Create the token and copy it to a secure location (you won't be able to see it again).

For more details, see
the [Manage API tokens for your Atlassian account](https://support.atlassian.com/atlassian-account/docs/manage-api-tokens-for-your-atlassian-account/).

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
2. Click the MCP Registry icon in the top right corner.
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

1. On GitHub, navigate to your repository.
2. Go to **Settings** → ** Copilot** → **Cloud agent**.
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

Install the GitHub Copilot CLI if you haven't already:

   ```bash
   npm install -g @github/copilot-cli
   ```

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
      "url": "https://mcp.atlassian.com/v1/mcp",
      "headers": {
        "Authorization": "Basic <base64(email:api_token)>"
      }
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
        "JIRA_API_TOKEN": "${{ secrets.COPILOT_MCP_ATLASSIAN_API_TOKEN }}"
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