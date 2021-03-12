module.exports = {
  email: 'sfreebobo@gmail.com',

  socialMedia: [
    {
      name: 'GitHub',
      url: 'https://github.com/WiseAI-Lab',
    },
  ],

  navLinks: [
    {
      name: '项目样例',
      url: '/#projects',
    },
    {
      name: '联系我们',
      url: '/#contact',
    },
  ],

  colors: {
    green: '#8892b0',
    navy: '#112240',
    darkNavy: '#233554',
  },

  srConfig: (delay = 200, viewFactor = 0.25) => ({
    origin: 'bottom',
    distance: '20px',
    duration: 500,
    delay,
    rotate: { x: 0, y: 0, z: 0 },
    opacity: 0,
    scale: 1,
    easing: 'cubic-bezier(0.645, 0.045, 0.355, 1)',
    mobile: true,
    reset: false,
    useDelay: 'always',
    viewFactor,
    viewOffset: { top: 0, right: 0, bottom: 0, left: 0 },
  }),
};
