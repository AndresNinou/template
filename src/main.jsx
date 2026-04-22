// hello world from haiku audit
// Import React dependencies
import { StrictMode } from 'react'
// Import React DOM utilities
import { createRoot } from 'react-dom/client'
// Import global styles
import './index.css'
// Import main App component
import App from './App.jsx'

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App />
  </StrictMode>,
)
