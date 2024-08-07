BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "teachers" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"first_name"	text,
	"last_name"	text,
	"email"	text,
	"phone_number"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "course_types" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"course_type_name"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "students" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"first_name"	text,
	"last_name"	text,
	"date_of_birth"	datetime,
	"email"	text,
	"phone_number"	text,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "subjects" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"subject_name"	text,
	"subject_type"	text,
	"total_study_hours"	integer,
	"note"	text,
	"course_type_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "fk_course_types_subject" FOREIGN KEY("course_type_id") REFERENCES "course_types"("id")
);
CREATE TABLE IF NOT EXISTS "erollment_schedules" (
	"id"	integer,
	"created_at"	datetime,
	"updated_at"	datetime,
	"deleted_at"	datetime,
	"schedule_date"	datetime,
	"subject_type"	text,
	"study_duration_hr"	integer,
	"subject_id"	integer,
	"teacher_id"	integer,
	"student_id"	integer,
	PRIMARY KEY("id" AUTOINCREMENT),
	CONSTRAINT "fk_students_erollment_schedule" FOREIGN KEY("student_id") REFERENCES "students"("id"),
	CONSTRAINT "fk_teachers_erollment_schedule" FOREIGN KEY("teacher_id") REFERENCES "teachers"("id"),
	CONSTRAINT "fk_subjects_erollment_schedule" FOREIGN KEY("subject_id") REFERENCES "subjects"("id")
);
CREATE INDEX IF NOT EXISTS "idx_teachers_deleted_at" ON "teachers" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_course_types_deleted_at" ON "course_types" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_students_deleted_at" ON "students" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_subjects_deleted_at" ON "subjects" (
	"deleted_at"
);
CREATE INDEX IF NOT EXISTS "idx_erollment_schedules_deleted_at" ON "erollment_schedules" (
	"deleted_at"
);
COMMIT;
