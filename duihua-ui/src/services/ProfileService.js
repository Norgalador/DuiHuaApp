import TABService from './TABService';

class ProfileService extends TABService {

    model = 'profile';

    getMyProfiles = () => 
        this._get(
            `${this.model}/my`
        )

}

export default new ProfileService();