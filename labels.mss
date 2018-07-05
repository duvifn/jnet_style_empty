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
/* ROAD LABELS
/* ================================================================== */
/*
#motorway_label[zoom>=11][zoom<=14][reflen<=8] {
  shield-name: "[ref]";
  shield-size: 9;
  shield-face-name: @sans_bold;
  shield-fill: #fff;
  shield-file: url(img/shield-motorway-1.png);
  [type='motorway'] {
    [reflen=1] { shield-file: url(img/shield-motorway-1a.png); }
    [reflen=2] { shield-file: url(img/shield-motorway-2a.png); }
    [reflen=3] { shield-file: url(img/shield-motorway-3a.png); }
    [reflen=4] { shield-file: url(img/shield-motorway-4a.png); }
    [reflen=5] { shield-file: url(img/shield-motorway-5a.png); }
    [reflen=6] { shield-file: url(img/shield-motorway-6a.png); }
    [reflen=7] { shield-file: url(img/shield-motorway-7a.png); }
    [reflen=8] { shield-file: url(img/shield-motorway-8a.png); }
  }
  [type='trunk'] {
    [reflen=1] { shield-file: url(img/shield-trunk-1a.png); }
    [reflen=2] { shield-file: url(img/shield-trunk-2a.png); }
    [reflen=3] { shield-file: url(img/shield-trunk-3a.png); }
    [reflen=4] { shield-file: url(img/shield-trunk-4a.png); }
    [reflen=5] { shield-file: url(img/shield-trunk-5a.png); }
    [reflen=6] { shield-file: url(img/shield-trunk-6a.png); }
    [reflen=7] { shield-file: url(img/shield-trunk-7a.png); }
    [reflen=8] { shield-file: url(img/shield-trunk-8a.png); }
  }
  [zoom=11] { shield-min-distance: 120; } 
  [zoom=12] { shield-min-distance: 120; } 
  [zoom=13] { shield-min-distance: 120; }
  [zoom=14] { shield-min-distance: 180; }
}

#motorway_label[type='motorway'][zoom>9],
#motorway_label[type='trunk'][zoom>9] {
  text-name:"[name]";
  text-face-name:@sans_bold;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:10;
  [zoom=11] { text-min-distance:70; }
  [zoom=12] { text-min-distance:80; }
  [zoom=13] { text-min-distance:100; }
}

#mainroad_label[type='primary'][zoom>12],
#mainroad_label[type='secondary'][zoom>13],
#mainroad_label[type='tertiary'][zoom>13] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}

#minorroad_label[zoom>14] {
  text-name:'[name]';
  text-face-name:@sans;
  text-placement:line;
  text-size:9;
  text-fill:@road_text;
  text-halo-fill:@road_halo;
  text-halo-radius:1;
  text-min-distance:60;
  text-size:11;
}
*/
/* ================================================================== */
/* ONE-WAY ARROWS
/* ================================================================== */
/*#motorway_label[zoom>=16],
#mainroad_label[zoom>=16],
#minorroad_label[zoom>=16] {
  [oneway = 'yes'],
  [oneway='-1'] {
     marker-placement:line;
     marker-max-error: 0.5;
     marker-spacing: 200;
     marker-file: url(img/icon/oneway.svg);
     [oneway='-1'] { marker-file: url(img/icon/oneway-reverse.svg); }
     [zoom=16] { marker-transform: "scale(0.5)"; }
     [zoom=17] { marker-transform: "scale(0.75)"; }
  }
}
*/

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
    text-fill: @water;// rgb(129,167,213); //#b3d6f6;
    text-halo-fill: rgb(129,167,213); //#b3d6f6;//@road_halo;
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