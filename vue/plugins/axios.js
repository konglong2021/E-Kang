export default ({ $axios, store  }) => {

  $axios.setBaseURL('https://radiant-tor-18088.herokuapp.com');
  $axios.setHeader('Access-Control-Allow-Origin', '*');

  //const token = store.getters['auth/token'];
  const token = store.$cookies.get("token");
  if (token) {
    $axios.setToken(token, 'Bearer')
  }

  $axios.interceptors.response.use(function (response) {
    return response
  }, function (error) {
    const { config, response } = error;
    const originalRequest = config;

    if (response && response.status === 401) {
      //notication or redirection
      if(response.data && response.data.message === 'Unauthenticated.'){
        store.$cookies.set('token', null);
      }
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
