import Default from "./components/layout/Default";
import Product from "./components/products/Product";
import Inventory from "./components/inventory/Inventory";
import Dashboard from "./components/Dashboard";
import Sale from "./components/sales/Sale";
import User from "./components/users/User";
import Category from "./components/category/Category";
import Brand from "./components/brand/Brand";

export const routes = [
    {path: '/', name: '/',component: Inventory},
    {path: '/inventory', name: 'inventory',component: Inventory},
    {path: '/category', name: 'category',component: Category},
    {path: '/product', name: 'product',component: Product},
    {path: '/brand', name: 'brand',component: Brand},
    // {path: '/dashboard', name: 'dashboard',component: Dashboard},
    // {path: '/sale', name: 'sale',component: Sale},
    // {path: '/user', name: 'user',component: User}
];
