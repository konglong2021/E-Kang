export const menuItems = [
    {
        id: 1,
        label: 'Main Category'
    },
    {
        id: 2,
        label: 'Dashboard',
        icon: 'fa fa-dashboard',
        link: '/dashboard'
    },
    {
        id: 3,
        label: 'POS System'
    },
    {
        id: 4,
        label: 'Inventory',
        icon: 'fa fa-building',
        link: '/inventory',
        subItems: [
            {
                id: 1,
                label: 'Supplier',
                icon: 'fa fa-sitemap',
                link: '/'
            },
            {
                id: 2,
                label: 'Warehouse',
                icon: 'fa fa-tasks',
                link: '/'
            },
            {
                id: 3,
                label: 'Brand',
                icon: 'fa fa-tasks',
                link: '/'
            },
            {
                id: 4,
                label: 'Category',
                icon: 'fa fa-tasks',
                link: '/'
            },
            {
                id: 5,
                label: 'Products',
                icon: 'fa fa-tasks',
                link: '/'
            },
            {
                id: 6,
                label: 'Products Price',
                icon: 'fa fa-tasks',
                link: '/'
            },
        ]
    },
    {
        id: 5,
        label: 'Sale',
        icon: 'fa fa-paint-brush',
        link: '/sale',
        subItems: [
            {
                id: 1,
                label: 'VIP Member',
                icon: 'fa fa-tasks',
                link: '/'
            },
            {
                id: 2,
                label: 'Customer',
                icon: 'fa fa-tasks',
                link: '/'
            },
            {
                id: 3,
                label: 'Orders',
                icon: 'fa fa-bell',
                link: '/'
            },
            {
                id: 4,
                label: 'Purchase',
                icon: 'fa fa-bell',
                link: '/'
            },
            {
                id: 5,
                label: 'Payment',
                icon: 'fa fa-bell',
                link: '/'
            },
        ]
    },
    {
        id: 6,
        label: 'User System'
    },
    {
        id: 7,
        label: 'User',
        icon: 'fa fa-magic',
        link: '/user',
        subItems: [
            {
                id: 1,
                label: 'Users',
                icon: 'fa fa-plane',
                link: '/'
            }
        ]
    },
];
