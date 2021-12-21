export default {
  // Global page headers: https://go.nuxtjs.dev/config-head
  head: {
    title: 'posui',
    htmlAttrs: {
      lang: 'en'
    },
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: '' },
      { name: 'format-detection', content: 'telephone=no' }
    ],
    link: [
      { rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }
    ]
  },

  // Global CSS: https://go.nuxtjs.dev/config-css
  /*css: [
    '@/static/css/font-awesome.css',
    '@/static/css/app.css'
  ],*/
  css: ['~/static/css/app.css', '~/static/css/font-awesome.css'],
  script: ['~/static/js/jquery-3.3.1.min.js'],

  // Plugins to run before rendering page: https://go.nuxtjs.dev/config-plugins
  plugins: [
    '~/plugins/axios',
    '~/plugins/axios',
    '~/plugins/vue-input-mask',
    '~/plugins/number-only',
    "~/plugins/vee-validate.js",
    "~/plugins/vue-html-to-paper.js",
    "~/plugins/vue-barcode.js",
  ],

  // Auto import components: https://go.nuxtjs.dev/config-components
  components: true,

  // Modules for dev and build (recommended): https://go.nuxtjs.dev/config-modules
  buildModules: [
    '@nuxtjs/fontawesome'
  ],

  // Modules: https://go.nuxtjs.dev/config-modules
  modules: [
    // https://go.nuxtjs.dev/bootstrap
    'bootstrap-vue/nuxt',
    '@nuxtjs/axios',
    '@nuxtjs/proxy',
    'nuxt-vue-multiselect',
    '@nuxtjs/i18n',
    '@nuxtjs/toast',
    'cookie-universal-nuxt',

  ],

  axios: {
    baseURL: 'http://localhost:8000/',
    headers: {
      common: {
        'Access-Control-Allow-Origin': '*',
        'Content-Type': 'application/json',
        Accept: 'application/json',
        Authorization: '',
      }
    },
    proxy: true,
  },
 //https://radiant-tor-18088.herokuapp.com/
  proxy: {
    '/api/': { target: 'http://localhost:8000/', pathRewrite: {'^/api/': ''}, changeOrigin: true }
  },
  router: {
    middleware: ['local-auth', 'check-auth']
  },

  ssr: true,
  target: 'server',

  i18n: {
    locales: [
      {
        code: 'en',
        file: 'en-US.js'
      },
      {
        code: 'kh',
        file: 'kh-KH.js'
      }
    ],
    lazy: true,
    langDir: 'lang/',
    defaultLocale: 'en'
  },

  toast: {
    position: 'top-center',
    register: [ // Register custom toasts
      {
        name: 'my-error',
        message: 'Oops...Something went wrong',
        options: {
          type: 'error'
        }
      }
    ]
  },

  // mode: 'spa',
  // devtools: true,

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
    transpile: ["vee-validate/dist/rules"],
  },
  loading: '~/components/loading.vue',
  loadingIndicator: {
    name: 'circle',
    color: '#3B8070',
    background: 'white'
  }
}
