export default function ({ store, redirect }){
  if(!store.$cookies.get("token")){
    return redirect('/login');
  }

}
