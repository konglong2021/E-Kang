import Cookie from 'js-cookie';

export const state = () => ({
  user: null,
  token: Cookie.get('token')
});

export const getters = {
  user: state => state.user,
  token: state => state.token,
  check: state => state.user !== null
};

export const mutations = {
  setToken(state, token){
    state.token = token;
    Cookie.set('token', token);
  },
  fetchUserSuccess(state, user){
    state.user = user;

  },
  fetchUserFailure(state){
    state.user = null;
  },
  logout(state){
    state.token = null;
    state.user = null;
    Cookie.set('token', null);
  },
  updateUser(state, { user }){
    state.user = user;
  }
};

export const actions = {
  saveToken({ commit }, { token, remember }){
    commit('setToken', token);
    Cookie.set('token', token);
  },
  async fetchUser({ commit }){
    try{
      const { data } = await this.$axios.get('/api/user');
      commit('fetchUserSuccess', data);
    }catch(e){
      Cookie.remove('token');
      commit('fetchUserFailure');
    }
  },
  updateUser({ commit }, payload){
    commit('updateUser', payload);
  },
  async logout({ commit }){
    try{
      await this.$axios.post('/api/logout');
    }catch(e){}
    Cookie.remove('token');
    commit('logout');
  }
};
