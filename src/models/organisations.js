import db from './db.js'

const getAllOrganisations = async() => {
    const query = `
        SELECT organisation_id, name, description, contact_email, logo_filename
      FROM public.organisation;
    `;

    const result = await db.query(query);

    return result.rows;
}

export {getAllOrganisations} 