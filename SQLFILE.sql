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


-- ========================================
-- Service Project Table
-- ========================================
CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organisation_id INTEGER NOT NULL,
    title VARCHAR(200) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT fk_organisation
        FOREIGN KEY (organisation_id) 
        REFERENCES organisation(organisation_id)
        ON DELETE CASCADE
);

-- ========================================
-- Insert sample data: Service Projects
-- ========================================

-- Projects for BrightFuture Builders (organization_id = 1)
INSERT INTO service_project (organisation_id, title, description, location, date) VALUES
(1, 'Community Playground Renovation', 'Volunteers will repair and repaint playground equipment, install new safety surfacing, and add accessible swings for children with disabilities.', 'Oakwood Community Park, 4500 Parkview Drive', '2026-06-15'),
(1, 'Senior Center Accessibility Ramp', 'Building wheelchair ramps and handrails for the downtown senior community center to improve accessibility for elderly residents.', 'Downtown Senior Center, 215 Elder Street', '2026-07-22'),
(1, 'Neighborhood Sidewalk Repair', 'Fixing cracked and uneven sidewalks in the Westside neighborhood to improve pedestrian safety and walkability.', 'Westside Neighborhood, Main Street Corridor', '2026-08-10'),
(1, 'School Garden Shed Construction', 'Constructing a storage shed and greenhouse for the Lincoln Elementary School garden program to support student agricultural education.', 'Lincoln Elementary School, 890 Education Lane', '2026-09-05'),
(1, 'Habitat Home Build Day', 'Partnering with Habitat for Humanity to frame and roof a new affordable home for a local family in need.', '123 Hope Avenue, Riverside District', '2026-10-12');

-- Projects for GreenHarvest Growers (organization_id = 2)
INSERT INTO service_project (organisation_id, title, description, location, date) VALUES
(2, 'Spring Community Garden Planting', 'Annual spring planting event where volunteers help prepare soil beds, plant vegetables, and set up irrigation systems for the community garden.', 'Sunrise Community Garden, 780 Green Valley Road', '2026-04-20'),
(2, 'Farmers Market Setup and Support', 'Assisting with the weekly farmers market setup, including vendor booth arrangement, signage placement, and customer information booth.', 'Downtown Plaza, 150 Market Square', '2026-05-30'),
(2, 'Food Bank Harvest Collection', 'Organizing a neighborhood harvest collection drive to gather fresh produce from local gardens for donation to the city food bank.', 'Various Locations - Central Collection at 340 Harvest Lane', '2026-07-15'),
(2, 'Urban Farming Workshop Series', 'Leading educational workshops on container gardening, composting, and sustainable growing practices for apartment residents.', 'GreenHarvest Education Center, 567 Grow Street', '2026-08-25'),
(2, 'School Nutrition Garden Installation', 'Installing raised garden beds and teaching students about growing their own food at Jefferson Middle School.', 'Jefferson Middle School, 234 Education Boulevard', '2026-09-18');

-- Projects for UnityServe Volunteers (organization_id = 3)
INSERT INTO service_project (organisation_id, title, description, location, date) VALUES
(3, 'Annual River Cleanup Day', 'Mobilizing 200+ volunteers to remove trash and debris from the Riverside Park area and adjacent waterways.', 'Riverside Park, 890 River Road', '2026-05-10'),
(3, 'Homeless Shelter Meal Service', 'Preparing and serving hot meals at the Hope Haven homeless shelter, with volunteers working in shifts throughout the day.', 'Hope Haven Shelter, 412 Compassion Way', '2026-06-28'),
(3, 'Back-to-School Supply Drive', 'Collecting, sorting, and distributing backpacks and school supplies to underprivileged students in the community.', 'UnityServe Community Center, 123 Volunteer Avenue', '2026-08-05'),
(3, 'Senior Tech Literacy Program', 'Teaching basic computer and smartphone skills to senior citizens at the local library to help them stay connected with family.', 'City Public Library, 789 Knowledge Parkway', '2026-09-22'),
(3, 'Emergency Preparedness Fair', 'Organizing a community fair to educate residents about emergency preparedness, including first aid demonstrations and disaster kit assembly.', 'Civic Center Auditorium, 321 Government Plaza', '2026-10-30');

-- ========================================
-- Verify data insertion
-- ========================================
SELECT * FROM service_project;