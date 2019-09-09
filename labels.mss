/* LABELS.MSS CONTENTS:
 * - place names
 * - area labels
 * - waterway labels 
 */

/* Font sets are defined in palette.mss */

/* 10M */
#contours [one_hundred != true][fifty != true][ele != 0]{
  [zoom>=17][zoom<=19]{
    text-name:[ele];
    text-face-name:@sans;
    text-placement:line;
    text-fill:#a2a2a2;
    text-halo-fill: @place_halo;
    text-halo-radius: 1;
    text-min-path-length: 200.0;
    text-spacing: 400.0;
    text-label-position-tolerance : 100;
    text-max-char-angle-delta: 10;
    text-size: 8;
  }
}
/* 50M */
#contours[fifty = true][ele != 0][zoom>=14][zoom<=17]{
  text-name:[ele] ;
  text-face-name:@sans;
  text-placement:line;
  [zoom=14] {text-fill: #aaa; } 
  [zoom > 14] {text-fill: #a2a2a2; }
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  text-min-path-length: 200.0;
  text-spacing: 400.0;
  text-label-position-tolerance : 100;
  text-max-char-angle-delta: 10;
  text-size: 8;
  [zoom >= 16] {text-size: 10; }
}

/* 100M */
#contours [one_hundred = true][fifty != true][ele != 0][zoom>=13][zoom<=17]{
  text-name:"[ele].replace('([0-9]+)\.(.+)','$1')";
  text-face-name:@sans;
  text-placement:line;
  text-fill:#a2a2a2;
  text-halo-fill: @place_halo;
  text-halo-radius: 1;
  [zoom >= 16] {text-size: 10; }
}


/* ================================================================== */
/* WATERWAY LABELS
/* ================================================================== */

#waterway_label[type='river'][zoom>=13],
#waterway_label[type='canal'][zoom>=15],
#waterway_label[type='stream'][zoom>=17] {
  text-name: '[name]';
  text-face-name: @sans_italic;
  text-fill: @water * 0.75;
  text-halo-fill: fadeout(lighten(@water,5%),25%);
  text-halo-radius: 1;
  text-placement: line;
  text-min-distance: 400;
  text-size: 10;
  [type='river'][zoom=15],
  [type='canal'][zoom=17] {
    text-size: 11;
  }
  [type='river'][zoom>=16],
  [type='canal'][zoom=18] {
    text-size: 14;
    text-spacing: 300;
  }
}

/* ================================================================== */
/* TRAIN STATIONS
/* ================================================================== */

#train_stations[zoom>15]{
  point-file:url('img/icon/rail-12.png');
  [zoom>=17] { point-file:url('img/icon/rail-18.png'); }
}

/* ****************************************************************** */
/* ================================================================== */
/* NATURAL POINTS
/* ================================================================== */
#cliffs{
    [zoom=13] {
       marker-placement:line;
       marker-max-error: 0.5;
       marker-spacing: 0;
       marker-file: url('img/cliff_z13.png');
    }
   [zoom=14] {
       marker-placement:line;
       marker-max-error: 0.5;
       marker-spacing: 0.1;
       marker-file: url('img/cliff_z14.png');
    }
   [zoom>15] {
       line-pattern-file: url('img/my_cliff2.png');
    }
  }

#springs::labels[zoom>=15] {
    text-name:'[name]';
    text-face-name:@sans;
    text-size:10;
    [zoom>=16] { text-size:11; }
    text-fill: @water;
    text-halo-fill: rgb(129,167,213); 
    text-halo-radius:0.4;
    text-placement: interior;
    text-dy: 7;
}
 
#natural_points["natural"='peak'][zoom>=13] {
      text-face-name:@sans;
      text-fill: #555555;
	  text-name: '[name]';
      text-placement: interior;
      text-dy: 7;
}

#natural_points["natural"='peak'][zoom>=14] {
      text-face-name:@sans;
      text-fill: #555555;
	  text-name: ''[name] + "\n" + [ele]'';
      text-placement: interior;
      text-dy: 7;
}