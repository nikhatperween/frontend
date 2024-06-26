import { Component, OnInit } from '@angular/core';
import { TestService } from './test.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
  title = 'my-app';

  constructor(private service: TestService){}
  ngOnInit(): void {
    this.getdata()
  }

  data: any
  getdata(){
    this.service.getData().subscribe((resp)=>{
      console.log(resp)
      this.data = resp
    }
  )
  }

}
