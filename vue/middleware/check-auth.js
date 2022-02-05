
export default async ({ $axios, store }) => {
  const token = store.$cookies.get("token");
  if (process.server) {
    if (token) {
      $axios.defaults.headers.common.Authorization = `Bearer ${token}`;
      $axios.defaults.headers.common['Access-Control-Allow-Origin'] = '*';
    }
    else {
      delete $axios.defaults.headers.common.Authorization;
    }
  }
  if (!store.getters['auth/check'] && token) {
    await store.dispatch('auth/fetchUser');
  }
}
