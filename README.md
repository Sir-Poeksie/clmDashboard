# Youth Community Led Monitoring Programme

This system tracks public health facilities monitored through patient interviews conducted by data capturers. Data focuses on youth-specific services segmented by gender, age, and facility location within the country in alignment with the **South African National AIDS Council’s** mandate outlined in the **National Strategic Plan 2024–2028**.

---

## Project Structure

This project is divided into two parts:

1. **MySQL Database Design**
2. **FastAPI-based CRUD API**

---

## Features

- Capture interviews conducted at public health facilities
- Segment patients by **age**, **gender**, and **location**
- Link interviews with **youth-specific health services**
- Track which **data capturer** conducted each interview
- RESTful API supporting Create operations for Patients and Interviews

---

## MySQL Database Design Use Case:
A community-led monitoring programme where data capturers conduct interviews with patients at health facilities to monitor youth-specific health services.

### Tables Included

- `Provinces`
- `Districts`
- `SubRegions`
- `Facilities`
- `Patients`
- `DataCapturers`
- `YouthServices`
- `Interviews`
- `InterviewServices` (many-to-many join table)

### File

- `community_monitoring.sql`

Includes:
- `CREATE DATABASE` and `USE` statements
- `CREATE TABLE` statements with primary and foreign key constraints
- Proper data types and validation rules
- Sample data for all tables

### ERD Diagram

TODO:[Insert a link & check how to add screenshot of your ERD here]

---

## FastAPI CRUD API

### Technologies Used:

- **FastAPI** – Python web framework
- **SQLAlchemy** – ORM for Python
- **MySQL** – Relational database
- **Uvicorn** – ASGI server

---

### 📂 Folder Structure

```

community\_monitoring\_api/
├── app/
│   ├── **init**.py
│   ├── main.py            # FastAPI app
│   ├── models.py          # SQLAlchemy models
│   ├── schemas.py         # Pydantic schemas
│   ├── crud.py            # CRUD operations
│   └── database.py        # DB connection setup
├── community\_monitoring.sql
├── requirements.txt
└── README.md

````

---

## How to Run the Project

### Prerequisites

- Python 3.9+
- MySQL Server
- Pip package manager

---

### Setup Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/community-led-monitoring.git
   cd community-led-monitoring
````

2. **Import the SQL file into MySQL**   
   ```bash
   mysql -u root -p < community_monitoring.sql
````

3. **Configure the database connection**
   
    Open `app/database.py` and update the credentials:
    ```python
    DATABASE_URL = "mysql+mysqlconnector://<username>:<password>@localhost/community_monitoring"
````

4. **Install Python dependencies**
   ```bash
   pip install -r requirements.txt
````

5. **Run the FastAPI server**
   ```bash
   uvicorn app.main:app --reload
````

---

## API Endpoints

| Method | Endpoint |Description|
| ------ | -------------- | --------------------------------- |
| POST   | `/patients/`   | Add a new patient                 |
| POST   | `/interviews/` | Create an interview with services |

### Example Request Body – `/patients/`
{
  "gender": "Female",
  "age": 19
}
```

### Example Request Body – `/interviews/`

```json
{
  "patient_id": 1,
  "facility_id": 1,
  "capturer_id": 1,
  "interview_date": "2025-05-01",
  "service_ids": [1, 2]
}
```

---

## 🧪 Sample Data Included

The SQL file includes realistic sample data for:

* Provinces (e.g., Gauteng, KwaZulu-Natal)
* Districts, SubRegions, Facilities
* Patients and Data Capturers
* Youth Services (e.g., HIV Testing, Mental Health)
* Interview records

---

## 🤝 Contributors

* **Mpumelelo Theophilas Nxazonke** – Database design & API development

---

## 📃 License

This project is open source and free to use under the [MIT License](LICENSE).

---

## Notes

This application is built for academic and pilot implementation purposes under a **Community Led Monitoring Programme**, contributing to evidence-based advocacy for youth and women in South Africa's public health sector.

```


