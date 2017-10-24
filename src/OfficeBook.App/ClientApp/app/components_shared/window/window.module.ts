import { NgModule } from '@angular/core';
import { WindowRef } from './window.ref';

@NgModule({
    declarations: [],
    imports: [],
    exports: [],
    providers: [
        { provide: WindowRef, useClass: WindowRef }
    ]
})
export class WindowModule {}