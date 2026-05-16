-- =====================================
-- Organisation Table
-- =====================================

CREATE TABLE organisation (
    organisation_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);


-- ========================================
-- Insert sample data: Organizations
-- ========================================
INSERT INTO organisation (name, description, contact_email, logo_filename)
VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

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


SELECT * FROM service_project;