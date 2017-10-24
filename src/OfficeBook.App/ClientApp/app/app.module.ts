import { NgModule, ValueProvider, OpaqueToken } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UniversalModule } from 'angular2-universal';
import { AppComponent } from './components/app/app.component'
import { NavMenuComponent } from './components/navmenu/navmenu.component';
import { HomeComponent } from './components/home/home.component';
import { FetchDataComponent } from './components/fetchdata/fetchdata.component';
import { CounterComponent } from './components/counter/counter.component';
import { NewPostComponent } from './components/newpost/newpost.component';
import { ForbiddenComponent } from './components/forbidden/forbidden.component';
import { UnauthorizedComponent } from './components/unauthorized/unauthorized.component';
import { Base64Util } from './components_shared/base64/base64.util';


import { APP_BASE_HREF } from '@angular/common';

import { SecurityService } from './app.security';
import { Configuration } from './app.configuration';

import { ValuesComponent } from './components/values/values.component';
import { ValuesService } from './components/values/values.service';


import { ToastComponent } from './components_shared/toast/toast.component';

import { ToastService } from './components_shared/toast/toast.service';

import { WindowModule } from './components_shared/window/window.module'

//import { AsyncLocalStorageModule } from 'angular2-async-local-storage';

import { LocalStorageModule } from 'angular-2-local-storage';

export function loadOnDemand(path: string) {
    return () => new Promise(resolve => (require as any).ensure([], () => resolve(require(path)))).then((p: any) => { return p.default; });
}

//const WINDOW_PROVIDER: ValueProvider = {
//    provide: new OpaqueToken('WindowToken'),
//    useValue: window || {}
//};

export const appRoutes: Routes = [
    { path: '', redirectTo: 'home', pathMatch: 'full' },
    { path: 'home', component: HomeComponent },
    { path: 'counter', component: CounterComponent },
    { path: 'fetch-data', component: FetchDataComponent },
    { path: 'forbidden', component: ForbiddenComponent },
    { path: 'unauthorized', component: UnauthorizedComponent },
    { path: 'values', component: ValuesComponent },
    { path: 'about', loadChildren: loadOnDemand('./components_lazy/about/about.module') },
    { path: '**', redirectTo: 'home' }
]

@NgModule({
    bootstrap: [AppComponent],
    declarations: [
        AppComponent,
        NavMenuComponent,
        CounterComponent,
        FetchDataComponent,
        HomeComponent,
        NewPostComponent,
        ToastComponent,
        ForbiddenComponent,
        UnauthorizedComponent,
        ValuesComponent
    ],
    providers: [
        { provide: APP_BASE_HREF, useValue: '/' },
        ToastService,
        SecurityService,
        ValuesService,
        Configuration,
        Base64Util
    ],
    imports: [
        UniversalModule, // Must be first import. This automatically imports BrowserModule, HttpModule, and JsonpModule too.
        WindowModule,
        RouterModule.forRoot(appRoutes),
        LocalStorageModule.withConfig({
            prefix: 'ob_',
            storageType: 'localStorage'
        })
       // AsyncLocalStorageModule
    ]
})
export class AppModule {
}