import { Component } from '@angular/core';

@Component({
    selector: 'about',
    template: require('./about.component.html')
})
export class AboutComponent {
    public aboutTitle: string = "Hello this is a string";
}
