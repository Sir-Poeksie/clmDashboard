from pydantic import BaseModel
from typing import List, Optional
from datetime import date
from enum import Enum

class GenderEnum(str, Enum):
    Male = "Male"
    Female = "Female"
    Other = "Other"

class PatientCreate(BaseModel):
    gender: GenderEnum
    age: int

class Patient(PatientCreate):
    patient_id: int

    class Config:
        orm_mode = True

class YouthService(BaseModel):
    service_id: int
    service_name: str

    class Config:
        orm_mode = True

class InterviewCreate(BaseModel):
    patient_id: int
    facility_id: int
    capturer_id: int
    interview_date: date
    service_ids: List[int]

class Interview(BaseModel):
    interview_id: int
    patient_id: int
    facility_id: int
    capturer_id: int
    interview_date: date
    services: List[YouthService]

    class Config:
        orm_mode = True
