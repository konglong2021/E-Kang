import Vue from 'vue';
Vue.directive('numericOnly', {
  bind(el) {
    el.addEventListener('keyup', () => {
      let regex = /^[0-9]*$/;
      if (!regex.test(el.value)) {
        //let newValue = el.value.replace(/[^\d]/g,'');
        //el.value = el.value.replace(/\D+/, '');
        el.value = "";
      }
    })
  }
});
