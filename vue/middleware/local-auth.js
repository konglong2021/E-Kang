export default function ({ store, redirect }){
  if(!store.$cookies.get("token")){
    return redirect('/login');
  }
  // if(store.$cookies.get("user")){
  //   console.log(store);
  // }
}
