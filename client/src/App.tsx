import { Routes, Route, useLocation, Navigate } from 'react-router'
import { AnimatePresence, motion } from 'framer-motion'
import Navbar from './components/Navbar'
import P2PApp from './pages/P2PApp'

function PageWrapper({ children }: { children: React.ReactNode }) {
  return (
    <motion.div
      initial={{ opacity: 0 }}
      animate={{ opacity: 1 }}
      exit={{ opacity: 0 }}
      transition={{ duration: 0.4, ease: 'easeInOut' }}
    >
      {children}
    </motion.div>
  )
}

export default function App() {
  const location = useLocation()

  return (
    <div className="min-h-screen p2p-mode" style={{ background: '#0f0d0a', color: '#f2efe8' }}>
      <Navbar />
      <AnimatePresence mode="wait">
        <Routes location={location} key={location.pathname}>
          <Route path="/" element={<PageWrapper><P2PApp /></PageWrapper>} />
          <Route path="/p2p" element={<PageWrapper><P2PApp /></PageWrapper>} />
          {/* Any other path redirects to P2P */}
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </AnimatePresence>
    </div>
  )
}
