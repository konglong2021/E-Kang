const cookieFromRequest = (request, key) => {
  if (!request.headers.cookie) {
    return;
  }
  const cookie = request.headers.cookie.split(';').find(
    c => c.trim().startsWith(`${key}=`)
  );
  if (cookie) {
    return cookie.split('=')[1];
  }
};
export const actions = {
  /*nuxtServerInit({ commit, dispatch, route }, { req }){
    const token = cookieFromRequest(req, 'token');
    if (!!token) {
      commit('auth/setToken', token);
    }
  }*/
  async nuxtServerInit ({ commit }, { store, route, req, res, app }) {
  if (route.query.token) {
    const token = `Bearer ${route.query.token}`;
    console.log("nuxtServerInit" + token);

  }
}
};
