// index.js
import express from 'express';
const app = express();
const PORT = 3000;

app.use(express.json());

let tasks = []; // In-memory task storage
let nextId = 1;

// Get all tasks
app.get('/tasks', (req, res) => {
  res.json(tasks);
});

// Add a new task
app.post('/tasks', (req, res) => {
  const { title } = req.body;
  if (!title) {
    return res.status(400).json({ error: 'Title is required' });
  }
  const task = { id: nextId++, title, done: false };
  tasks.push(task);
  res.status(201).json(task);
});

// Mark a task as done
app.put('/tasks/:id/done', (req, res) => {
  const task = tasks.find(t => t.id == req.params.id);
  if (!task) {
    return res.status(404).json({ error: 'Task not found' });
  }
  task.done = true;
  res.json(task);
});

// Delete a task
app.delete('/tasks/:id', (req, res) => {
  const index = tasks.findIndex(t => t.id == req.params.id);
  if (index === -1) {
    return res.status(404).json({ error: 'Task not found' });
  }
  const removed = tasks.splice(index, 1);
  res.json(removed[0]);
});

// Start server
app.listen(PORT, () => {
  console.log(`To-Do API running at http://localhost:${PORT}`);
});
