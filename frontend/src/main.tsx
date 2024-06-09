import React from 'react'
import ReactDOM from 'react-dom/client'
import {createBrowserRouter, RouterProvider} from "react-router-dom";
import Home from "./pages/Home.tsx";
import AnotherPage from "./pages/AnotherPage.tsx";
import Root from "./Root.tsx";
import LoginPage from "./pages/LoginPage.tsx";
import ConfirmSignUp from "./pages/ConfirmSignUp.tsx";

export const routes = [
  {
    path: "/",
    element: <Root/>,
    children: [{
        path: "/",
        element: <Home/>,
      },
      {
        path: "/login",
        element: <LoginPage/>,
      },
      {
        path: "/confirm",
        element: <ConfirmSignUp/>,
      },
      {
        path: "another-page",
        element: <AnotherPage/>,
      },
    ]
  },
]
const router = createBrowserRouter(routes);

ReactDOM.createRoot(document.getElementById('root')!).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>,
)
