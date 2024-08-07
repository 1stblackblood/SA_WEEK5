package main

import (
	"github.com/sa67-lab5/entity"
	"gorm.io/driver/sqlite"
	"gorm.io/gorm"
)

func main() {
	db, err := gorm.Open(sqlite.Open("sa-67.db"), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	// Migrate the schema
	db.AutoMigrate(&entity.Teacher{}, &entity.CourseType{}, &entity.Student{}, &entity.Subject{}, &entity.ErollmentSchedule{})
}