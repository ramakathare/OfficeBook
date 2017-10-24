import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AboutComponent } from './about.component';

export const routes: Routes = [
    { path: '', component: AboutComponent },
];

@NgModule({
    declarations: [AboutComponent],
    imports: [RouterModule.forChild(routes)],
    exports: [],
    providers : []
})
export default class AboutModule {
}
