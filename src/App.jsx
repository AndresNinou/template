// TestB standard
import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import './App.css'

// TestC iteration 2 added a fix
console.log('TestC iteration 1')

/**
 * App component - The main application component.
 * Displays a simple counter application with links to Vite and React documentation,
 * featuring a button that increments a counter on click.
 * @component
 * @returns {JSX.Element} The rendered App component
 */
function App() {
  console.log('App loaded')
  const [count, setCount] = useState(0)
  // TODO: add unit tests for the counter component

  return (
    <>
      <div>
        <a href="https://vite.dev" target="_blank">
          <img src={viteLogo} className="logo" alt="Vite logo" />
        </a>
        <a href="https://react.dev" target="_blank">
          <img src={reactLogo} className="logo react" alt="React logo" />
        </a>
      </div>
      <h1>Vite + React</h1>
      <div className="card">
        <button onClick={() => setCount((count) => count + 1)}>
          count is {count}
        </button>
        <p>
          Edit <code>src/App.jsx</code> and save to test HMR
        </p>
      </div>
      <p className="read-the-docs">
        Click on the Vite and React logos to learn more
      </p>
      <footer className="footer">
        © 2026 Parallex Test
      </footer>
    </>
  )
}

export default App

// Lifecycle-A standard test 1776920518
