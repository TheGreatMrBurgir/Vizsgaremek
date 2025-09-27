import { createRouter, createWebHistory } from 'vue-router';

import HomeView from '@/views/HomeView.vue';
import RegisterView from '@/views/RegisterView.vue';
import LoginView from '@/views/LoginView.vue';
import ConnetionsView from '@/views/ConnetionsView.vue';
import TermsAndConditionsView from '@/views/TermsAndConditionsView.vue';
import PrivacyAndPolicyView from '@/views/PrivacyAndPolicyView.vue';
import AdminView from '@/views/AdminView.vue';
import AboutView from '@/views/AboutView.vue';
import HowToHelpView from '@/views/HowToHelpView.vue';
import ProfileView from '@/views/ProfileView.vue';
import ProductsView from '@/views/ProductsView.vue';



const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component: HomeView,
    },
    {
      path: '/about',
      name: 'about',
      component: AboutView,
    },
    {
      path: '/HowToHelp',
      name: 'HowToHelp',
      component: HowToHelpView,
    },
    {
      path: '/products',
      name: 'products',
      component: ProductsView,
    },
    {
      path: '/Profile',
      name: 'ProfileView',
      component: ProfileView,
    },
    {
      path: '/register',
      name: 'register',
      component: RegisterView,
    },
    {
      path: '/login',
      name: 'login',
      component: LoginView,
    },
    {
      path: '/connection',
      name: 'connection',
      component: ConnetionsView,
    },
    {
      path: '/terms',
      name: 'terms',
      component: TermsAndConditionsView,
    },
    {
      path: '/policy',
      name: 'policy',
      component: PrivacyAndPolicyView,
    },
    {
      path: '/admin',
      name: 'admin',
      component: AdminView,
    },
  ],
});

export default router;
