# MySQL Docker Setup

A Docker Compose configuration for running MySQL 8.0 database.

## Prerequisites

- Docker installed on your system
- Docker Compose installed on your system

## Configuration

The setup uses the following environment variables (defined in `.env`):
- `MYSQL_DATABASE`: Database name
- `MYSQL_USER`: Database user
- `MYSQL_PASSWORD`: User password
- `MYSQL_ROOT_PASSWORD`: Root password

## Configuration Setup

Passwords and credentials are passed via a `.env` file in the project root. Create one before starting the container:

```bash
MYSQL_DATABASE=mydb
MYSQL_USER=user
MYSQL_PASSWORD=userpass
MYSQL_ROOT_PASSWORD=rootpass
```

> **Note:** Do not commit `.env` to version control. Add it to `.gitignore`.

## Getting Started

1. Make sure Docker and Docker Compose are installed
2. Clone this repository
3. Create the `.env` file as described above
4. Start the container:
   ```bash
   docker-compose up -d
   ```

## Connection Details

### Authentication Note
The server uses the `caching_sha2_password` authentication plugin (MySQL 8+ default). Some older clients might need updating or additional configuration to connect.

### Local Connection
- Host: `localhost` or `127.0.0.1`
- Port: `33307`
- Database: `mydb`
- Username: `user`
- Password: `userpass`

### Root Access
- Username: `root`
- Password: `rootpass`

## Connection Examples

### Using MySQL CLI
```bash
mysql -h localhost -P 33307 -u user -p mydb
```

### Using Connection String
```
mysql://user:userpass@localhost:33307/mydb
```

## Health Check

The container includes a health check that runs every 10 seconds to ensure the database is responsive.

## Container Management

Stop the container:
```bash
docker-compose down
```

View logs:
```bash
docker-compose logs mysql
```

## Persistent Data

Data is persisted using a named volume `mysql_data`. This ensures your data persists between container restarts.
