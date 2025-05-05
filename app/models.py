from sqlalchemy import Column, Integer, String, Date, Enum, ForeignKey, Table
from sqlalchemy.orm import relationship
from app.database import Base
import enum

class GenderEnum(str, enum.Enum):
    Male = "Male"
    Female = "Female"
    Other = "Other"

interview_services = Table(
    'InterviewServices', Base.metadata,
    Column('interview_id', Integer, ForeignKey('Interviews.interview_id')),
    Column('service_id', Integer, ForeignKey('YouthServices.service_id'))
)

class Patient(Base):
    __tablename__ = "Patients"
    patient_id = Column(Integer, primary_key=True, index=True)
    gender = Column(Enum(GenderEnum), nullable=False)
    age = Column(Integer, nullable=False)

class YouthService(Base):
    __tablename__ = "YouthServices"
    service_id = Column(Integer, primary_key=True, index=True)
    service_name = Column(String(100), unique=True, nullable=False)

class Interview(Base):
    __tablename__ = "Interviews"
    interview_id = Column(Integer, primary_key=True, index=True)
    patient_id = Column(Integer, ForeignKey("Patients.patient_id"))
    facility_id = Column(Integer)
    capturer_id = Column(Integer)
    interview_date = Column(Date)

    services = relationship("YouthService", secondary=interview_services)
