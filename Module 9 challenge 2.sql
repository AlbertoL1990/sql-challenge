-- Create tables

CREATE TABLE "titles" (
    "title_id" VARCHAR(5)   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     ),
    CONSTRAINT "uc_titles_title" UNIQUE (
        "title"
    )
);

Select * from titles

CREATE TABLE "departments" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_departments_dept_name" UNIQUE (
        "dept_name"
    )
);

Select * from departments limit 10

CREATE TABLE "employees" (
    "emp_no" INT  NOT NULL, -- Cannot use SERIAL as there is a break between 299999 and 400000
    "emp_title_id" VARCHAR(5)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(1)   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

Select  * from employees limit 10

CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" money   NOT NULL,
    CONSTRAINT "pk_salaries" PRIMARY KEY (
        "emp_no"
     )
);

Select * from salaries limit 35

CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(4)   NOT NULL,
    CONSTRAINT "pk_dept_emp" PRIMARY KEY (
        "emp_no","dept_no"
     )
);

Select * from dept_emp limit 10

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(4)   NOT NULL,
    "emp_no" VARCHAR(5)   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "dept_no", "emp_no"
    ),
    CONSTRAINT "fk_dept_manager_dept" FOREIGN KEY (
        "dept_no"
    ) REFERENCES "departments" ("dept_no"),
    CONSTRAINT "fk_dept_manager_emp" FOREIGN KEY (
        "emp_no"
    ) REFERENCES "employees" ("emp_no")
);

Select * from dept_manager limit 10

-- Add contraints to tables created

ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "employees" ADD CONSTRAINT "CHK_sex_validation" CHECK ("sex" IN ("F", "M"))
;

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")