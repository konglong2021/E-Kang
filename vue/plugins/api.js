export default function ({ $axios }, inject) {
  // Create a custom axios instance
  const api = $axios.create({
    headers: {
      common: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': window.localStorage.getItem('user-token')
      },
    }
  });

  // Set baseURL to something different
  api.setBaseURL('https://radiant-tor-18088.herokuapp.com/');

  // Inject to context as $api
  inject('api', api)
}
