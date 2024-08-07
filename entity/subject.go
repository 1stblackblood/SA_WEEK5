package entity

import (
	
	"gorm.io/gorm"
)

type Subject struct {
	gorm.Model
	SubjectName string
	SubjectType string
	TotalStudyHours    int
	Note string

	CourseTypeID *uint
	CourseType   CourseType `gorm:"foriegnKey:CourseTypeID"`
	
	ErollmentSchedule []ErollmentSchedule `gorm:"foreignKey:SubjectID"`
}