import { Injectable } from '@angular/core';
import { Http, Response, Headers } from '@angular/http';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs/Observable';
import { Configuration } from '../../app.configuration';
import { SecurityService } from '../../app.security';

@Injectable()
export class ValuesService {

    //private actionUrl: string;
    private valuesUrl: string;
    private userInfoUrl: string;
    private headers: Headers;

    constructor(private _http: Http, private _configuration: Configuration, private _securityService: SecurityService) {
        this.valuesUrl = `${_configuration.ApiServer}api/Values/`;
        this.userInfoUrl = `${_configuration.IdentityServer}connect/userinfo`;    
    }

    //public DownloadFile(id: string) {
    //    this.setHeaders();
    //    let oneTimeAccessToken = "";
    //    this._http.get(`${this.actionUrl}GenerateOneTimeAccessToken/${id}`, {
    //        headers: this.headers,
    //        body: ''
    //    }).map(
    //        res => res.text()
    //        ).subscribe(
    //        data => {
    //            oneTimeAccessToken = data;
                
    //        },
    //        error => this._securityService.HandleError(error),
    //        () => {
    //            console.log(`open DownloadFile for file ${id}: ${this.actionUrl}${oneTimeAccessToken}`);
    //            window.open(`${this.actionUrl}${oneTimeAccessToken}`);
    //        });
    //}

    public GetValues = (): Observable<string> => {
        this.setHeaders();
        return this._http.get(this.valuesUrl, {
            headers: this.headers,
            body: ''
        }).map(res => res.json());
    }

    //UserInfo
    public GetUserInfo = (): Observable<string> => {
        this.setHeaders();
        return this._http.get(this.userInfoUrl, {
            headers: this.headers,
            body: ''
        }).map(res => res.json());
    }

    private setHeaders() {
        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
        this.headers.append('Accept', 'application/json');

        var token = this._securityService.GetToken();

        if (token !== "") {
            this.headers.append('Authorization', 'Bearer ' + token);
        }
    }
}