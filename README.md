# docker-postgres-windows
A Docker image for PostgreSQL on Windows.

## Usage

### Build

#### Export environment variables

Use PowerShell to set your user-specific environment variables:

```powershell
[Environment]::SetEnvironmentVariable("GITHUB_ACCOUNT", "<github account>", "User")
[Environment]::SetEnvironmentVariable("GITHUB_TOKEN", "<github personal-access token (PAT)>", "User")
```
#### Build the image
```powershell
PS> docker build --build-arg "GITHUB_TOKEN=$env:GITHUB_TOKEN" --build-arg "GITHUB_BRANCH=$env:GITHUB_BRANCH" --tag "windows-postgres:latest" .
```

## Links

- [PostgreSQL 12 Silent Install (How-To Guide)](https://silentinstallhq.com/postgresql-12-silent-install-how-to-guide/)