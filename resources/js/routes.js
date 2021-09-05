import Default from "./components/layout/Default";
import Product from "./components/products/Product";
import Inventory from "./components/inventory/Inventory";
import Dashboard from "./components/Dashboard";
import Sale from "./components/sales/Sale";
import User from "./components/users/User";

export const routes = [
    {path: '/', name: '/',component: Default},
    {path: '/product', name: 'product',component: Product},
    {path: '/inventory', name: 'inventory',component: Inventory},
    {path: '/dashboard', name: 'dashboard',component: Dashboard},
    {path: '/sale', name: 'sale',component: Sale},
    {path: '/user', name: 'user',component: User}
];
