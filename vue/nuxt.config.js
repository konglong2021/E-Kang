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
    '@nuxtjs/auth',
  ],

  axios: {
    baseURL: 'http://localhost:8000', // Used as fallback if no runtime config is provided
    headers: {
      common: {
        Accept: 'application/json, text/plain, */*'
      }
    },
  },
  proxy: {
    '/api/': { target: 'http://localhost:8000', pathRewrite: {'^/api/': ''}, changeOrigin: true }
  },
  router: {
    middleware: ['auth']
  },
  auth: {
    redirect: {
      login: '/login',
      logout: '/logout',
      home: '/'
    },
    strategies: {
      local: {
        endpoints: {
          login: {
            url: "/api/login",
            method: "post",
            propertyName: "data.token",

          },
          logout: false,
          user: {
            url: "/api/user",
            method: "get",
            propertyName: "data.user",
          },
        },
        tokenType: 'Bearer',
        tokenName: 'x-auth',
        autoFetchUser: false
      },
    },
    watchLoggedIn: false,
    localStorage: {
      prefix: 'auth.'
    },
  },

  i18n: {
    locales: ['en', 'fr', 'es'],
    defaultLocale: 'en',
    vueI18n: {
      fallbackLocale: 'en',
      messages: {
        en: {
          welcome: 'Welcome'
        },
        fr: {
          welcome: 'Bienvenue'
        },
        es: {
          welcome: 'Bienvenido'
        }
      }
    }
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

  // Build Configuration: https://go.nuxtjs.dev/config-build
  build: {
  }
}
