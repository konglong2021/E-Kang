export default ({ $axios, store , redirect }) => {
  $axios.setBaseURL('http://localhost:8000');
  $axios.setHeader('Access-Control-Allow-Origin', '*');
  $axios.setToken(store.$cookies.get("token"), 'Bearer');

  $axios.interceptors.response.use(function (response) {
    return response
  }, function (error) {
    const { config, response } = error;
    const originalRequest = config;

    if (response && (response.status === 401 || response.status === 422)) {
      store.$cookies.set('token', null);
      return redirect('/login');
    }
    return Promise.reject(error);
  });

  $axios.onResponseError(error => {
    const { status } = error.response || {};
    if (status === 401 && store.getters['auth/check']) {
      store.commit('auth/logout');
    }
    else{
      return Promise.reject(error);
    }
  });
}
