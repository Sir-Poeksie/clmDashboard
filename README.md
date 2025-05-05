# 🧾 Youth & Women Led Community Led Monitoring Programme

This system tracks public health facilities monitored through patient interviews conducted by data capturers. Data focuses on youth-specific services segmented by gender, age, and facility location within the country in alignment with the **South African National AIDS Council’s** mandate as outlined in the **National Strategic Plan 2024–2028**.

---
## 📁 Project Structure

This project is divided into two main components:

1. **MySQL Database Design**
2. **FastAPI-based CRUD API**

---

## 📊 Features

- Capture interviews conducted at public health facilities
- Segment patients by **age**, **gender**, and **location**
- Link interviews with **youth-specific health services**
- Track which **data capturer** conducted each interview
- RESTful API supporting Create operations for Patients and Interviews

---

## Question 1: MySQL Database Use Case
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
- `CREATE TABLE` statements with primary and foreign key constraints
- Proper data types and integrity rules
- Sample data for all tables

### ERD Diagram
TODO: Check how to do this by imbedding image or alternately link to image in the docs folder

---

## Question 2: FastAPI CRUD API

### Technologies Used

- **FastAPI** – Python web framework
- **SQLAlchemy** – ORM for Python
- **MySQL** – Relational database
- **Uvicorn** – ASGI server

### Folder Structure
    community_monitoring_api/
    ├── app/
    │   ├── __init__.py
    │   ├── main.py
    │   ├── models.py
    │   ├── schemas.py
    │   ├── crud.py
    │   └── database.py
    ├── docs/
    │   ├── clmERD.drawio
    │   ├── main.py
    ├── community_monitoring.sql
    ├── requirements.txt
    └── README.md


---

## How to Run the Project

### Prerequisites

- Python 3.9+
- MySQL Server
- Pip package manager

### Steps

1. **Clone the repo**  
   ```bash
   git clone https://github.com/Sir-Poeksie/clmDashboard.git
   cd clmDashboard
2. **Import SQL file into MySQL**  
   ```bash
  mysql -u root -p community_monitoring < community_monitoring.sql
3. **Import SQL file into MySQL**  
   ```bash
  mysql -u root -p community_monitoring < community_monitoring.sql
4. **Install dependencies**  
   ```bash
  pip install -r requirements.txt
5. **Run the FastAPI server**  
   ```bash
 uvicorn app.main:app --reload
