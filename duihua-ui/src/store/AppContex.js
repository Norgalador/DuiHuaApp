import React, { useState, createContext, useEffect } from 'react';

import userService from '../services/UserService';
import profileService from '../services/ProfileService';

const AppContext = createContext();

function AppProvider({ children }) {

    /* state items */
    const [ user, setUser ] = useState(undefined);
    const [ profiles, setProfiles ] = useState(null);

    // check for current user
    useEffect(() => {
        if ( window.localStorage.getItem('access_token') !== null ) {
            userService.getCurrentUser()
                    .then( resp => setUser(resp))
                    .catch( err => setUser(null))
        } else {
            setUser(null);
        }
    }, [])

    // load items needed once the user is logged in
    useEffect(() => {
        if ( user )
            profileService.getMyProfiles(user.id)
                .then( resp => setProfiles(resp) )
                .catch( err => console.log(err) )

    }, [user])

    /* make logout available anywhere */
    const logout = () => {

        window.localStorage.removeItem('access_token')
        userService.logout()
            .finally( resp => setUser(null))
    }

    return (
        <AppContext.Provider value= {{ // add any attributes or methods you want to make accessible
            user,
            setUser,
            profiles,
            setProfiles,
            logout
        }}>
            { children }
        </AppContext.Provider>
    )
}

export { AppProvider, AppContext };