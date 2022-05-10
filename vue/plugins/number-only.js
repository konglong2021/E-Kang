import Vue from 'vue';
Vue.directive('numericOnly', {
  bind(el) {
    el.addEventListener('keyup', () => {
      let regex = /^[0-9]*$/;
      if (!regex.test(el.value)) {
        el.value = el.value.slice(0, -1)
      }
    })
  }
});
