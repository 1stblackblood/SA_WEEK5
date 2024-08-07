package entity

import (
	
	"gorm.io/gorm"
)

type CourseType struct {
	gorm.Model
	CourseTypeName string

	Subject []Subject `gorm:"foreignKey:CourseTypeID"`

}