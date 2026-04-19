---
title: Connecting Copilot with Jira using Atlassian Rovo MCP Server
date: 2026-04-11
header:
  image: /assets/images/posts/atlassian-mcp.png
  teaser: /assets/images/posts/atlassian-mcp.png
---

Connect GitHub Copilot with Jira using the Atlassian Rovo MCP Server to enable real-time interaction with Jira, Compass,
and Confluence data directly from your development environment. This guide walks you through the setup and verification
process.

For more details, see the official
guide: [Getting started with the Atlassian Rovo MCP Server](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/getting-started-with-the-atlassian-remote-mcp-server/).

## Atlassian Rovo MCP Server

The Atlassian Rovo MCP Server is Atlassian's official implementation of the Model Context Protocol (MCP) that connects Atlassian's 
tools with your LLM, IDE, or agent platforms of choice..

See the [atlassian-mcp-server GitHub repository](https://github.com/atlassian/atlassian-mcp-server) for more details.

## Configure  Rovo MCP Server

1. Enable the API Token authentication method:
    - See
      the [authentication configuration instructions](https://support.atlassian.com/security-and-access-policies/docs/control-atlassian-rovo-mcp-server-settings/#Configure-authentication).

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

1. When prompted, a browser window will open.
2. Grant access to your Jira site as instructed.

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
      "tools": ["*"],
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
      "args": ["mcp-atlassian"],
      "env": {
        "JIRA_URL": "https://ibanfr.atlassian.net",
        "JIRA_USERNAME": "yourjirauser@email.com",
        "JIRA_API_TOKEN": "${{ secrets.COPILOT_MCP_ATLASSIAN_API_TOKEN }}"
      },
      "tools": ["*"]
    }
  }
}
```
## Other resources

- [Guía práctica MCP: cómo conectar Atlassian con herramientas externas](https://blog.deiser.com/es/guia-practica-mcp-como-conectar-atlassian-con-herramientas-externas)