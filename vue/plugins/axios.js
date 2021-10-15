export default ({ $axios, store  }) => {

  $axios.setBaseURL('http://localhost:8000');

  //const token = store.getters['auth/token'];
  const token = store.$cookies.get("token");
  if (token) {
    $axios.setToken(token, 'Bearer')
  }

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
