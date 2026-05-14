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