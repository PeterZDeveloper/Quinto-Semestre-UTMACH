import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import path from 'path';
import { AboutComponent } from './components/about/about.component';
import { HeroesComponent } from './components/heroes/heroes.component';
import { HomeComponent } from './components/home/home.component';
import { HeroeComponent } from './components/heroe/heroe.component';

const routes: Routes = [
  {path: 'home', component:HomeComponent },
  {path: 'heroes', component:HeroesComponent },
  {path: 'about', component:AboutComponent },
  {path: 'heroe/:id', component:HeroeComponent }, //ruta con parametro los : indican la variable
  {path: '**', pathMatch:'full',redirectTo:'home'}


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
