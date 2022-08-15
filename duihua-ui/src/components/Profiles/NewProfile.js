import React, { useState, useEffect, useContext } from 'react';
import profileService from '../../services/ProfileService';
import { AppContext } from '../../store/AppContext';
import { useNavigate } from "react-router-dom";

const NewProfile = ( props ) => {

    let nav = useNavigate();

    const { profiles, setProfiles } = useContext(AppContext);

    const [ profile, setProfile ] = useState({
        languagesSpoken: '',
        languagesLearning: '',
        interests: '',
        description: '',
    });

    const [ saving, setSaving ] = useState(false);

    const canSave = profile.user !== ""

    const saveProfile = () => {
        setSaving(true);

        profileService.create(profile)
            .then( resp => {
                setTopics([resp, ...profiles]);
            })
            .catch( err => console.log(err) )
            .finally( resp => {
                nav('/my-profile')
            })
    }

    return (
        <fieldset className='row' disabled={saving}>
            <div className='col-12 col-md-6 mb-2'>
                <h5>Languages Spoken: <span className='required'>required</span></h5>
                
                <input
                    className='form-control'
                    value={profile.languagesSpoken}
                    onChange={(e) => setProfile({...profile, languagesSpoken: e.target.value})}
                />
            </div>
            <div className='col-12 col-md-6 mb-2'>
                <h5>Languages Learning:</h5>
                <input
                    className='form-control'
                    value={profile.languagesLearning}
                    onChange={(e) => setProfile({...profile, languagesLearning: e.target.value})}
                />
            </div>
            <div className='col-12 col-md-6 mb-2'>
                <h5>Interests:</h5>
                <textarea
                    className='form-control'
                    value={profile.interests}
                    onChange={(e) => setProfile({...profile, interests: e.target.value})}
                />
            </div>
            <div className='col-12 col-md-6 mb-2'>
                <h5>Description:</h5>
                <textarea
                    className='form-control'
                    value={profile.description}
                    onChange={(e) => setProfile({...profile, description: e.target.value})}
                />
            </div>
            <div className='col-12 text-center mt-2'>
                <button
                    className='btn btn-success'
                    disabled={ !canSave }
                    onClick={saveTopic}
                    >Save</button>
            </div>
        </fieldset>
    )
}

export default NewTopic;