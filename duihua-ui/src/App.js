import React, { useState, useContext } from 'react';
import {BrowserRouter, Routes, Route} from "react-router-dom";
import './App.css';
import { AppContext } from './store/AppContext';
import Login from './components/Login';
import Navigation from './components/Navigation';
import Profile from './components/profiles/Profile';
import NewProfile from './components/profiles/NewProfile';

function App() {

  const { user, logout } = useContext(AppContext);

  const Logout = ( props ) => 
    <>
      {logout()}
    </>

  return (
    <div className='container-fluid'>
      {
        user === undefined ?
          <></>
          : user === null ?
            <Login/>
            :
            <BrowserRouter>
              <Navigation />
              <Routes>
                <Route path="/login" element={<Login />}/>
                <Route path="/logout" element={<Logout />}/>
                <Route path="/profile/new" element={<NewProfile />}/>
                <Route path="/profile/:id" element={<Profile />}/>
              </Routes>
            </BrowserRouter>
      }
    </div>
  );
}

export default App;
