import { Component } from '@angular/core';
import { Heroe, HeroesService } from '../../services/heroes.service';
import { Router } from '@angular/router';


@Component({
  selector: 'app-heroes',
  templateUrl: './heroes.component.html',
  styleUrl: './heroes.component.css'
})
export class HeroesComponent {
heroes:Heroe[]=[];

constructor(private _heroService:HeroesService, private route:Router){

}
 ngOnInit(): void {
  //Called after the constructor, initializing input properties, and the first call to ngOnChanges.
  //Add 'implements OnInit' to the class.
 this.heroes = this._heroService.getHeroes();
  console.log(this.heroes);
 }
 
 verHeroe(idx:number)
 {
  console.log(idx)
  this.route.navigate(['/heroe',idx])
 }
}
