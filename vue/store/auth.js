import Cookie from 'js-cookie';

export const state = () => ({
  //token: Cookie.get('token'),
  token: null,
  user: null,
  cashBalance: 0,
  storeItem: null,
  setting: null,
});

export const getters = {
  token: state => state.token,
  user: state => state.user,
  cashBalance: state => state.cashBalance,
  storeItem: state => state.storeItem,
  setting: state => state.setting,
  check: state => state.user !== null,
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
  },
  setUser(state, user){
    state.user = user;
    Cookie.set('user', user);
  },
  setCashBalance(state, cashBalance){
    state.cashBalance = cashBalance;
    Cookie.set('cashBalance', cashBalance);
  },
  setStoreItem(state, storeItem){
    state.storeItem = storeItem;
    Cookie.set('storeItem', storeItem);
  },
  setSetting(state, token){
    state.token = token;
    Cookie.set('token', token);
  },
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
