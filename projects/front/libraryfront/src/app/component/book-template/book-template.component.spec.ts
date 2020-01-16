import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BookTemplateComponent } from './book-template.component';

describe('BookTemplateComponent', () => {
  let component: BookTemplateComponent;
  let fixture: ComponentFixture<BookTemplateComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BookTemplateComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BookTemplateComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
