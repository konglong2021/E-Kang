import Vue from 'vue';
Vue.directive('inputTextUppercase', {
  bind(el) {
    el.addEventListener('keyup', () => {
      el.value = el.value.toUpperCase();
    })
  }
});
