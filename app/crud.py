from sqlalchemy.orm import Session
from app import models, schemas

def create_patient(db: Session, patient: schemas.PatientCreate):
    db_patient = models.Patient(**patient.dict())
    db.add(db_patient)
    db.commit()
    db.refresh(db_patient)
    return db_patient

def create_interview(db: Session, interview: schemas.InterviewCreate):
    db_interview = models.Interview(
        patient_id=interview.patient_id,
        facility_id=interview.facility_id,
        capturer_id=interview.capturer_id,
        interview_date=interview.interview_date
    )
    services = db.query(models.YouthService).filter(models.YouthService.service_id.in_(interview.service_ids)).all()
    db_interview.services = services
    db.add(db_interview)
    db.commit()
    db.refresh(db_interview)
    return db_interview
