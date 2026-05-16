-- =====================================
-- Organisation Table
-- =====================================

CREATE TABLE organisation (
      organisation_id SERIAL PRIMARY KEY,
	  name VARCHAR(150) NOT NULL,
	  description TEXT NOT NULL,
	  contact_email VARCHAR(225) NOT NULL,
	  logo_filename VARCHAR(225) NOT NULL

);

CREATE TABLE service_project (
        project_id SERIAL PRIMARY KEY,
		organisation_id INTEGER NOT NULL,
		title VARCHAR(200) NOT NULL,
		description TEXT NOT NULL,
		location VARCHAR(225),
		date DATE NOT NULL,
		CONSTRAINT fk_service_project_organisation
		FOREIGN KEY (organisation_id)
		REFERENCES organisation(organisation_id)
		ON DELETE CASCADE
		
);