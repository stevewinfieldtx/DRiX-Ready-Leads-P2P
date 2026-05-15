import { Routes, Route, useLocation, Navigate } from 'react-router'
import { AnimatePresence, motion } from 'framer-motion'
import Navbar from './components/Navbar'
import P2PApp from './pages/P2PApp'
import DistributorApp from './pages/DistributorApp'

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
  const isP2P = location.pathname === '/p2p' || location.pathname === '/'
  const isDistributor = location.pathname === '/distributor'

  const modeClass = isDistributor ? 'distributor-mode' : 'p2p-mode'
  const bgColor = isDistributor ? '#0d0f12' : '#0f0d0a'
  const textColor = isDistributor ? '#e2e8f0' : '#f2efe8'

  return (
    <div className={`min-h-screen ${modeClass}`} style={{ background: bgColor, color: textColor }}>
      <Navbar />
      <AnimatePresence mode="wait">
        <Routes location={location} key={location.pathname}>
          <Route path="/" element={<PageWrapper><P2PApp /></PageWrapper>} />
          <Route path="/p2p" element={<PageWrapper><P2PApp /></PageWrapper>} />
          <Route path="/distributor" element={<PageWrapper><DistributorApp /></PageWrapper>} />
          <Route path="*" element={<Navigate to="/" replace />} />
        </Routes>
      </AnimatePresence>
    </div>
  )
}
