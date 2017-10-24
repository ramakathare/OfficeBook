﻿import { Injectable, OnInit,Inject } from '@angular/core';
import { Http, Response, Headers } from '@angular/http';
import 'rxjs/add/operator/map';
import { Observable } from 'rxjs/Observable';
import { Configuration } from './app.configuration';
import { Router } from '@angular/router';
//import { AsyncLocalStorage } from 'angular2-async-local-storage';
import { LocalStorageService } from 'angular-2-local-storage';
import { Base64Util } from './components_shared/base64/base64.util';

import { WindowRef } from './components_shared/window/window.ref';

@Injectable()
export class SecurityService {

   // private actionUrl: string;
    private headers: Headers;
    //private base64: Base64Util;

    constructor(
        private _windowRef: WindowRef,
        private _http: Http,
        private _configuration: Configuration,
        private _router: Router,
        private _storage: LocalStorageService,
        private _base64: Base64Util
    ) {
        // this.actionUrl = _configuration.ApiServer + 'api/values/';
        //this.configuration = _configuration;
        this.headers = new Headers();
        this.headers.append('Content-Type', 'application/json');
        this.headers.append('Accept', 'application/json');
        //this.storage = _storage;//localStorage; //localStorage;

        if (this.retrieve("IsAuthorized") !== "") {
            //this.HasAdminRole = this.retrieve("HasAdminRole");
            this.IsAuthorized = this.retrieve("IsAuthorized");
        }
    }

    //ngOnInit() {
    //    //  this.actionUrl = _configuration.ApiServer + 'api/values/';
    //    //this.configuration = _configuration;
    //    this.headers = new Headers();
    //    this.headers.append('Content-Type', 'application/json');
    //    this.headers.append('Accept', 'application/json');
    //    this.storage = sessionStorage; //localStorage;

    //    if (this.retrieve("IsAuthorized") !== "") {
    //        //this.HasAdminRole = this.retrieve("HasAdminRole");
    //        this.IsAuthorized = this.retrieve("IsAuthorized");
    //    }
    //}

    public IsAuthorized: boolean;
    //public HasAdminRole: boolean;

    public GetToken(): any {
        return this.retrieve("authorizationData");
    }

    public ResetAuthorizationData() {
        this.store("authorizationData", "");
        this.store("authorizationDataIdToken", "");

        this.IsAuthorized = false;
        //this.HasAdminRole = false;
        //this.store("HasAdminRole", false);
        this.store("IsAuthorized", false);
    }

    public SetAuthorizationData(token: any, id_token: any) {
        if (this.retrieve("authorizationData") !== "") {
            this.store("authorizationData", "");
        }

        this.store("authorizationData", token);
        this.store("authorizationDataIdToken", id_token);
        this.IsAuthorized = true;
        this.store("IsAuthorized", true);

        //var data: any = this.getDataFromToken(id_token);
        //for (var i = 0; i < data.role.length; i++) {
        //    if (data.role[i] === "dataEventRecords.admin") {
        //        this.HasAdminRole = true;
        //        this.store("HasAdminRole", true)
        //    }
        //}
    }

    public Authorize() {
        this.ResetAuthorizationData();

        console.log("BEGIN Authorize, no auth data");

        var authorizationUrl = this._configuration.IdentityServer  + '/connect/authorize';
        var client_id = 'OfficeBook.App';
        var redirect_uri = this._configuration.RedirectUri;
        var response_type = "id_token token";
        var scope = "OfficeBook.WebApi openid profile email";
        var nonce = "N" + Math.random() + "" + Date.now();
        var state = Date.now() + "" + Math.random();

        this.store("authStateControl", state);
        this.store("authNonce", nonce);
        console.log("AuthorizedController created. adding myautostate: " + this.retrieve("authStateControl"));

        var url =
            authorizationUrl + "?" +
            "response_type=" + encodeURI(response_type) + "&" +
            "client_id=" + encodeURI(client_id) + "&" +
            "redirect_uri=" + encodeURI(redirect_uri) + "&" +
            "scope=" + encodeURI(scope) + "&" +
            "nonce=" + encodeURI(nonce) + "&" +
            "state=" + encodeURI(state);

        this._windowRef.nativeWindow.location.href = url;
    }

    public AuthorizedCallback(hashString) {
        console.log("BEGIN AuthorizedCallback, no auth data");
        this.ResetAuthorizationData();

        var hash = hashString.substr(1);

        var result: any = hash.split('&').reduce(function (result, item) {
            var parts = item.split('=');
            result[parts[0]] = parts[1];
            return result;
        }, {});

        console.log(result);
        console.log("AuthorizedCallback created, begin token validation");

        var token = "";
        var id_token = "";
        var authResponseIsValid = false;
        if (!result.error) {

            if (result.state !== this.retrieve("authStateControl")) {
                console.log("AuthorizedCallback incorrect state");
            } else {

                token = result.access_token;
                id_token = result.id_token

                var dataIdToken: any = this.getDataFromToken(id_token);
                console.log(dataIdToken);

                // validate nonce
                if (dataIdToken.nonce !== this.retrieve("authNonce")) {
                    console.log("AuthorizedCallback incorrect nonce");
                } else {
                    this.store("authNonce", "");
                    this.store("authStateControl", "");

                    authResponseIsValid = true;
                    console.log("AuthorizedCallback state and nonce validated, returning access token");
                }
            }
        }

        if (authResponseIsValid) {
            this.SetAuthorizationData(token, id_token);
            console.log(this.retrieve("authorizationData"));


            alert("valid");

            // router navigate to DataEventRecordsList
            //this._router.navigate(['/dataeventrecords/list']);
        }
        else {
            this.ResetAuthorizationData();
            this._router.navigate(['/Unauthorized']);
        }
    }

    //public Logoff() {
    //    var authorizationUrl = this._configuration.IdentityServer + '/connect/userinfo';

    //    var id_token_hint = this.retrieve("authorizationDataIdToken");
    //    var post_logout_redirect_uri = this._configuration.RedirectUri + '/unauthorized';

    //    var url =
    //        authorizationUrl + "?" +
    //        "id_token_hint=" + encodeURI(id_token_hint) + "&" +
    //        "post_logout_redirect_uri=" + encodeURI(post_logout_redirect_uri);

    //    this.ResetAuthorizationData();

    //    alert("LogOff");

    //    window.location.href = url;
    //}

    public Logoff() {
        // /connect/endsession?id_token_hint=...&post_logout_redirect_uri=https://myapp.com
        console.log("BEGIN Authorize, no auth data");

        var authorizationUrl = this._configuration.IdentityServer + '/connect/endsession';

        var id_token_hint = this.retrieve("authorizationDataIdToken");
        var post_logout_redirect_uri = this._configuration.PostLogoutRedirectUri;

        var url =
            authorizationUrl + "?" +
            "id_token_hint=" + encodeURI(id_token_hint) + "&" +
            "post_logout_redirect_uri=" + encodeURI(post_logout_redirect_uri);

        this.ResetAuthorizationData();

        //alert("LogOff");

        this._windowRef.nativeWindow.location.href = url;
    }

    public HandleError(error: any) {
        console.log(error);
        if (error.status == 403) {
            this._router.navigate(['/forbidden'])
        }
        else if (error.status == 401) {
            this.ResetAuthorizationData();
            this._router.navigate(['/unauthorized'])
        }
    }

    private urlBase64Decode(str) {
        var output = str.replace('-', '+').replace('_', '/');
        switch (output.length % 4) {
            case 0:
                break;
            case 2:
                output += '==';
                break;
            case 3:
                output += '=';
                break;
            default:
                throw 'Illegal base64url string!';
        }

        return this._base64.decode(output);
    }

    private getDataFromToken(token) {
        var data = {};
        if (typeof token !== 'undefined') {
            var encoded = token.split('.')[1];
            data = JSON.parse(this.urlBase64Decode(encoded));
        }

        return data;
    }

    private retrieve(key: string): any {
        //var item: string = 

            return this._storage.get(key)//.subscribe((value) => { item = value }, () => { });

        //if (item && item !== 'undefined') {
        //    return JSON.parse(item);
        //}

        ////var item = this.storage[key];

        ////if (item && item !== 'undefined') {
        ////    return JSON.parse(this.storage[key]);
        ////}

        //return;
    }

    private store(key: string, value: any) {
        //this._storage.setItem(key, JSON.stringify(value)).subscribe(() => { }, () => { });;

        this._storage.set(key, value);

        //this.storage[key] = JSON.stringify(value);

    }

}