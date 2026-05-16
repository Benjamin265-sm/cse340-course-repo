import db from './db.js';

const getAllProjects = async () => {
    const query = `
        SELECT 
            sp.project_id,
            sp.organisation_id,
            sp.title, 
            sp.description, 
            sp.location, 
            sp.date, 
            o.name AS organization_name
        FROM public.service_project AS sp
        INNER JOIN public.organisation AS o
            ON sp.organisation_id = o.organisation_id;
    `;
    
    const results = await db.query(query);
    return results.rows;
};

export default getAllProjects;