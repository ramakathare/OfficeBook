import { Injectable } from '@angular/core';

@Injectable()
export class Configuration {
    public ApiServer: string = "http://localhost:44360/";
    public IdentityServer: string = "http://localhost:44340/";
    public RedirectUri: string = "http://localhost:44350";
    public PostLogoutRedirectUri: string = this.RedirectUri + "/home";
}