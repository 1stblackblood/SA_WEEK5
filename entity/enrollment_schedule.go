package entity

import (
	"time"

	"gorm.io/gorm"
)

type ErollmentSchedule struct {
	gorm.Model
	ScheduleDate time.Time 
	SubjectType string
	StudyDurationHR    int
	
	SubjectID *uint
	Subject   Subject `gorm:"foriegnKey:SubjectID"`

	TeacherID *uint
	Teacher   Teacher `gorm:"foriegnKey:TeacherID"`

	StudentID *uint
	Student   Student `gorm:"foriegnKey:StudentID"`
}