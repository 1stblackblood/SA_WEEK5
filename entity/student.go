package entity

import (
	"time"

	"gorm.io/gorm"
)

type Student struct {
	gorm.Model
	FirstName   string
	LastName    string
	DateOfBirth time.Time
	Email       string
	PhoneNumber string

	ErollmentSchedule []ErollmentSchedule `gorm:"foreignKey:StudentID"`
}
