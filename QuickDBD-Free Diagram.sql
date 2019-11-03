-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/n71stB
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "Departments" (
    "department_number" VARCHAR(10)   NOT NULL,
    "department_name" VARCHAR(50)   NOT NULL,
    CONSTRAINT "pk_Departments" PRIMARY KEY (
        "department_number"
     )
);

CREATE TABLE "EmployeesDepartment" (
    "employee_number" INTEGER   NOT NULL,
    "department_number" VARCHAR(10)   NOT NULL,
    "empdept_from_date" DATE   NOT NULL,
    "empdept_to_date" DATE   NOT NULL
);

CREATE TABLE "ManagersDepartment" (
    "department_number" VARCHAR(10)   NOT NULL,
    "employee_number" INTEGER   NOT NULL,
    "mgrdept_from_date" DATE   NOT NULL,
    "mgrdept_to_date" DATE   NOT NULL
);

CREATE TABLE "Employees" (
    "employee_number" INTEGER   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "employee_first_name" VARCHAR(30)   NOT NULL,
    "employee_last_name" VARCHAR(30)   NOT NULL,
    "employee_gender" VARCHAR(1)   NOT NULL,
    "employee_hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_Employees" PRIMARY KEY (
        "employee_number"
     )
);

CREATE TABLE "Salaries" (
    "employee_number" INTEGER   NOT NULL,
    "employee_salary" MONEY   NOT NULL,
    "salary_from_date" DATE   NOT NULL,
    "salary_to_date" DATE   NOT NULL
);

CREATE TABLE "Titles" (
    "employee_number" INTEGER   NOT NULL,
    "employee_title" VARCHAR(50)   NOT NULL,
    "title_from_date" DATE   NOT NULL,
    "title_to_date" DATE   NOT NULL
);

ALTER TABLE "Departments" ADD CONSTRAINT "fk_Departments_department_number" FOREIGN KEY("department_number")
REFERENCES "ManagersDepartment" ("department_number");

ALTER TABLE "EmployeesDepartment" ADD CONSTRAINT "fk_EmployeesDepartment_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Employees" ("employee_number");

ALTER TABLE "EmployeesDepartment" ADD CONSTRAINT "fk_EmployeesDepartment_department_number" FOREIGN KEY("department_number")
REFERENCES "Departments" ("department_number");

ALTER TABLE "Employees" ADD CONSTRAINT "fk_Employees_employee_number" FOREIGN KEY("employee_number")
REFERENCES "Titles" ("employee_number");

