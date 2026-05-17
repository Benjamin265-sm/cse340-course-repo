import express from 'express';
import { fileURLToPath } from 'url';
import path from 'path';
import { testConnection } from './src/models/db.js';
import { getAllOrganisations } from './src/models/organisations.js';
import getAllProjects from './src/models/projects.js';




// Define the the application environment
const NODE_ENV = process.env.NODE_ENV?.toLowerCase() || 'production';

// Define the port number the server will listen on
const PORT = process.env.PORT || 3000;
const __filename = fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const app = express();
/**
  * Configure Express middleware
  */

// Serve static files from the public directory
// Set EJS as the templating engine
app.set('view engine', 'ejs');

// Tell Express where to find your templates
app.set('views', path.join(__dirname, 'src/views'));
app.use(express.static(path.join(__dirname, 'public')));

const sampleProjects = [
    { id: 1, title: 'Park Cleanup', category: 'Environment', active: true },
    { id: 2, title: 'Food Drive', category: 'Community', active: false },
    { id: 3, title: 'Tutor Program', category: 'Education', active: true },
];

function getActiveProjectSummary(projects) {
    const activeProjects = projects.filter(project => project.active);
    const titles = activeProjects.map(project => project.title);
    const summary = {
        totalProjects: projects.length,
        activeCount: activeProjects.length,
        activeTitles: titles,
    };

    if (summary.activeCount > 0) {
        summary.message = `There are ${summary.activeCount} active projects.`;
    } else {
        summary.message = 'No active projects currently available.';
    }

    return summary;
}

async function loadProjectSummary() {
    const projects = await Promise.resolve(sampleProjects);
    const summary = getActiveProjectSummary(projects);
    return {
        timestamp: new Date().toISOString(),
        ...summary,
    };
}

/**
 * Routes
 */
app.get('/', async (req, res) => {
    const title = 'Home';
    res.render('home', { title });
});

app.get('/organisations', async (req, res) => {
    const organisations = await getAllOrganisations();
    const title = 'Our Partner Organisations';

    res.render('organisations', { title, organisations });
});

app.get('/projects', async (req, res) => {
    const title = 'Service Projects';
    let projects = [];

    try {
        projects = await getAllProjects();
        console.log('Retrieved projects:', projects);
    } catch (error) {
        console.error('Failed to load service projects:', error);
    }

    res.render('projects', { title, projects });
});

app.get('/categories', async (req, res) => {
    const title = 'Service Categories';
    res.render('categories', { title });
});




app.listen(PORT, async () => {
  try {
    await testConnection();

    const projects = await getAllProjects();
    console.log('Loaded projects:', projects);

    console.log(`Server is running at http://127.0.0.1:${PORT}`);
    console.log(`Environment: ${NODE_ENV}`);
  } catch (error) {
    console.error('Error connecting to the database:', error);
  }
});