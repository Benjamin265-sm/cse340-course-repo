import db from './db.js'

const getAllProjects = async() => {
    const query = `
        SELECT 
            sp.project_id,
            sp.title,
            sp.description,
            sp.location,
            sp.date,
            sp.organisation_id,
            o.name as organisation_name
        FROM public.service_project sp
        JOIN public.organisation o ON sp.organisation_id = o.organisation_id
        ORDER BY sp.date;
    `;

    const result = await db.query(query);
    return result.rows;
}

export { getAllProjects }