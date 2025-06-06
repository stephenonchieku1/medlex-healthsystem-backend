# Health Information System API

A Rails API for managing health programs, clients, and program enrollments.

## Features

- Create and manage health programs (e.g., TB, Malaria, HIV)
- Register and manage client information
- Enroll clients in health programs
- Search for clients
- View client profiles and program enrollments

## API Endpoints (v1)

### Health Programs

- `GET /api/v1/health_programs` - List all programs
- `GET /api/v1/health_programs/:id` - Get program details
- `POST /api/v1/health_programs` - Create new program
- `PUT /api/v1/health_programs/:id` - Update program
- `DELETE /api/v1/health_programs/:id` - Delete program

### Clients

- `GET /api/v1/clients` - List all clients
- `GET /api/v1/clients/:id` - Get client details
- `POST /api/v1/clients` - Register new client
- `PUT /api/v1/clients/:id` - Update client
- `GET /api/v1/clients/search?q=:query` - Search clients
- `GET /api/v1/clients/:id/enrollments` - Get client's program enrollments

### Enrollments

- `POST /api/v1/enrollments` - Enroll client in program
- `PUT /api/v1/enrollments/:id` - Update enrollment status
- `GET /api/v1/enrollments/:id` - Get enrollment details

## Setup

1. Install dependencies:
   ```bash
   bundle install
   ```

2. Set up the database:
   ```bash
   rails db:create
   rails db:migrate
   ```

3. Start the server:
   ```bash
   rails server
   ```

## Data Models

### HealthProgram
- id: UUID (Primary Key)
- name: String
- description: Text
- active: Boolean
- created_at: DateTime
- updated_at: DateTime

### Client
- id: UUID (Primary Key)
- first_name: String
- last_name: String
- date_of_birth: Date
- gender: String
- address: Text
- phone_number: String
- email: String
- created_at: DateTime
- updated_at: DateTime

### Enrollment
- id: UUID (Primary Key)
- client_id: UUID (Foreign Key)
- health_program_id: UUID (Foreign Key)
- enrollment_date: Date
- status: String (active, completed, cancelled)
- created_at: DateTime
- updated_at: DateTime

## Security Considerations

- All endpoints require authentication (to be implemented)
- Input validation for all fields
- Data encryption for sensitive information
- Rate limiting for API endpoints
- CORS configuration for frontend access

## Testing

Run the test suite:
```bash
rails test
```

## Contributing

1. Fork the repository
2. Create your feature branch
3. Commit your changes
4. Push to the branch
5. Create a new Pull Request
